import json
import tempfile
import os
import requests
import zipfile


class Extension:
    def __init__(self, name: str, publisher: str, version: str, sha256: str) -> None:
        self.name = name
        self.publisher = publisher
        self.version = version
        self.sha256 = sha256


class ExtensionDecoder(json.JSONDecoder):
    def __init__(self, object_hook=None, *args, **kwargs):
        super().__init__(object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, o):
        decoded_extension = Extension(
            o.get('name'),
            o.get('publisher'),
            o.get('version'),
            o.get('sha256')
        )
        return decoded_extension


class ExtensionEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, Extension):
            return {
                "name": o.name,
                "publisher": o.publisher,
                "version": o.version,
                "sha256": o.sha256
            }
        else:
            return super().default(o)


def get_latest_version(name: str, publisher: str) -> Extension:
    url = "https://{0}.gallery.vsassets.io/_apis/public/gallery/publisher/{0}/extension/{1}/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage".format(publisher, name)

    res = requests.get(url, stream=True)

    with tempfile.TemporaryDirectory() as tmp:
        extension_zip = tmp + "/" + name + ".zip"

        with open(extension_zip, 'wb') as fd:
            for chunk in res.iter_content(chunk_size=128):
                fd.write(chunk)

        zipfile.ZipFile(extension_zip).extractall(tmp)

        with open(tmp + "/extension/package.json") as f:
            latest_version = json.load(f)["version"]

        with os.popen("nix hash file --base32 --type sha256 " + extension_zip) as cmd:
            hash = cmd.read().rstrip()
    return Extension(name, publisher, latest_version, hash)


def show_diff(current_list: list[Extension], latest_list: list[Extension]) -> list[str]:
    diffs: list[str] = []
    for current, latest in zip(current_list, latest_list):
        if (current.version != latest.version):
            diffs.append("{0}.{1}: {2} -> {3}".format(current.publisher, current.name, current.version, latest.version))
    return diffs


def main():
    # TODO fix path to managed.json file
    with open(os.path.expanduser("~/.dotfiles/applications/code/managed.json"), "r+") as f:
        extensions = json.load(f, cls=ExtensionDecoder)
        f.truncate()
        f.seek(0)
        updated_extensions = list(map(lambda extension: get_latest_version(extension.name, extension.publisher), extensions))
        json.dump(updated_extensions, f, cls=ExtensionEncoder, indent=2)
        result = show_diff(extensions, updated_extensions)
        # TODO prepare commit instead of just showing the updates
        if len(result) == 0:
            print("Nothing to update")
        else:
            list(map(print, result))


main()
