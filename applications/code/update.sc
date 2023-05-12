#!/usr/bin/env -S scala-cli shebang

//> using scala 3

//> using lib "com.lihaoyi::requests::0.8.0"
//> using lib "com.lihaoyi::upickle::3.1.0"
//> using lib "com.lihaoyi::os-lib::0.9.1"

import upickle.default.*

final case class Extension(
    name: String,
    publisher: String,
    version: String,
    sha256: String
) derives ReadWriter

// TODO make it pure (extract hash to another function, efficiently)
def getLatestVersion(name: String, publisher: String): Extension =
  val wd = os.temp.dir()
  val extZip = os.temp(dir = wd, suffix = ".zip")

  requests.get
    .stream(
      s"https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${name}/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
    )
    .readBytesThrough(os.write.over(extZip, _))

  // TODO provision using nix
  os.proc("unzip", "-o", "-q", extZip.toString).call(wd)
  val latestVersion =
    ujson.read(os.read(wd / "extension" / "package.json"))("version").str

  val hash = os
    .proc(
      "nix",
      "hash",
      "file",
      "--base32",
      "--type",
      "sha256",
      extZip.toString
    )
    .call(wd)
    .out
    .trim()

  Extension(name, publisher, latestVersion, hash)

// TODO better diff
def showDiff(current: List[Extension], latest: List[Extension]): List[String] =
  current
    .zip(latest)
    .foldLeft(List.empty[String])((diff, exts) =>
      val (current, latest) = exts
      if (current.version != latest.version) then
        diff ::: s"${current.publisher}.${current.name}: ${current.version} -> ${latest.version}" :: Nil
      else diff
    )

val managedJson: os.Path =
  os.home / ".dotfiles" / "applications" / "code" / "managed.json"

val manualJson: os.Path =
  os.home / ".dotfiles" / "applications" / "code" / "manual.json"

def updateManaged() =
val currentExtensions: List[Extension] =
    upickle.default.read[List[Extension]](os.read(managedJson))
val updatedExtensions: List[Extension] =
  currentExtensions.map(e => getLatestVersion(e.name, e.publisher))
os.write.over(
    managedJson,
  upickle.default.write(updatedExtensions, indent = 2) ++ "\n"
)
  showDiff(currentExtensions, updatedExtensions).map(println)
end updateManaged

def rehash(name: String, publisher: String, version: String): Extension =
  val wd = os.temp.dir()
  val extZip = os.temp(dir = wd, suffix = ".zip")

  requests.get
    .stream(
      s"https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
    )
    .readBytesThrough(os.write.over(extZip, _))

  val hash = os
    .proc(
      "nix",
      "hash",
      "file",
      "--base32",
      "--type",
      "sha256",
      extZip.toString
    )
    .call(wd)
    .out
    .trim()

  Extension(name, publisher, version, hash)
end rehash

def rehashManual() =
  val extensions = upickle.default.read[List[Extension]](os.read(manualJson))
  val rehashed = extensions.map(e => rehash(e.name, e.publisher, e.version))
  os.write.over(manualJson, upickle.default.write(rehashed, indent = 2) ++ "\n")
end rehashManual

// MAIN
updateManaged()
rehashManual()
