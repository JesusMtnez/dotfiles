# SublimeText Plugins
## Pre-installation.
Before begining, install __Package Control__ for *Sublime Text 2/3*. To do so, just open the Sublime Text console (<code>ctrl + `</code>  or <code>Show > View console</code>) and paste the following code:

__Sublime Text 2__
```python
import urllib2,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) ); by = urllib2.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None; print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) if dh != h else 'Please restart Sublime Text to finish installation')
```

__Sublime Text 3__
```python
import urllib.request,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```
Or follow the instructions __[here](https://packagecontrol.io/installation)__.

## List of Plugins:
### Avaliable in Package Control.
- __Auto Semi-Colon__:
    + __Description__: This plugin automatically moves a semi-colon to outside of the last bracket when pressed inside one of more pairs of brackets.
    + [GitHub](https://github.com/vivait/SublimeAutoSemiColon).
- __C Improved__:
    + __Description__: This package provides better support of C/C++/Objective-C languages in Sublime Text. It is primarily focused on pure C overriding a standard syntax definition shipped with Sublime Text, though once installed it affects other C-family languages as well. Note that C Improved per se provides only the syntax definition among with some symbol indexing settings, nothing more. That is, it is not a self-sustained package, but only an addition (improvement) to the standard C++ package.
    + [GitHub](https://github.com/abusalimov/SublimeCImproved).
- __Djainero__:
    + __Description__: Django support for Sublime Text 2/3.
    + [GitHub](https://github.com/squ1b3r/Djaneiro).
- __DocBlockr__:
    + __Description__: DocBlockr is a package for Sublime Text 2 & 3 which makes writing documentation a breeze. DocBlockr supports JavaScript (including ES6), PHP, ActionScript, Haxe, CoffeeScript, TypeScript, Java, Groovy, Objective C, C, C++ and Rust.
    + [GitHub](https://github.com/spadgos/sublime-jsdocs).
- __Dotfiles Syntex Highlighting__:
    + __Description__: Want ShellScript (Bash) syntax highlighting for your dotfiles? You're damn right you do!
    + [GitHub](https://github.com/mattbanks/dotfiles-syntax-highlighting-st2).
- __Emmet__:
    + __Description__: Official Emmet plugin (previously called Zen Coding) for Sublime Text.
    + [GitHub](https://github.com/sergeche/emmet-sublime).
    + [Homepage](http://emmet.io/).
- __Git__:
    + __Description__: Git integration: it's pretty handy. Who knew, right?
    + [GitHub](https://github.com/kemayo/sublime-text-git).
- __GitGutter__:
    + __Description__: A sublime text 2/3 plugin to show an icon in the gutter area indicating whether a line has been inserted, modified or deleted.
    + [GitHub](https://github.com/jisaacks/GitGutter).
- __LiveReload__:
    + __Description__: A web browser page reloading plugin for the Sublime Text 3 editor.
    + [GitHub](https://github.com/dz0ny/LiveReload-sublimetext2).
- __MacTerminal__:
    + __Description__: MacTerminal is a SublimeText plugin. It opens new Terminal tab (on current or new window if necessary). It's working with Terminal and iTerm.
    +  [GitHub](https://github.com/afterdesign/MacTerminal).
- __MarkdownEditing__:
    + __Description__: Markdown plugin for Sublime Text. Provides a decent Markdown color scheme (light and dark) with more robust syntax highlighting and useful Markdown editing features for Sublime Text. 3 flavors are supported: Standard Markdown, GitHub Flavored Markdown (GFM), MultiMarkdown.
    + [GitHub](https://github.com/SublimeText-Markdown/MarkdownEditing)
- __Markdown Preview__:
    + __Description__: Preview and build your markdown files quickly in your web browser from Sublime Text 2/3.
    + [GitHub](https://github.com/revolunet/sublimetext-markdown-preview).
- __OmniMarkupPreviewer__:
    + __Description__: OmniMarkupPreviewer is a plugin for both Sublime Text 2 and Sublime Text 3 that preview markups in web browsers. OmniMarkupPreviewer renders markups into htmls and send it to web browser in the backgound, which enables a live preview. Besides, OmniMarkupPreviewer provide support for exporting result to html file as well.
    + [GitHub](https://github.com/timonwong/OmniMarkupPreviewer).
- __Package Resource Viewer__
    + __Description__: Plugin to assist viewing and editing package resources in Sublime Text 2 and Sublime Text 3.
    + [GitHub](https://github.com/skuroda/PackageResourceViewer).
- __Plain Tasks__:
    + __Description__: An opinionated todo-list plugin for Sublime Text 2/3 editor.
    + [GitHub](https://github.com/aziz/PlainTasks).
- __Project Manager__:
    + __Description__: Dont't have any idea what `*.sublime-project` and `*.sublime-workspace are doing? Forget where the project files are? Project Manager will help organizing the project files for you. It is inspired by Atom's Project Manager.
    + [GitHub](https://github.com/randy3k/Project-Manager).
- __Prolog__:
    + __Description__: This package provides syntax highlighting and automated build for the logic programming language Prolog.
    + [GitHub](https://github.com/alnkpa/sublimeprolog).
-   __Scope Hunter__:
    +   __Description__: This is a simple plugin get the scope under the cursor(s) in Sublime Text. This is useful for plugin development.
    +   [GitHub](https://github.com/facelessuser/ScopeHunter).
- __SideBar Enhancements__:
    + __Description__: Provides enhancements to the operations on sidebar of files and folders for Sublime Text.
    + [GitHub](https://github.com/titoBouzout/SideBarEnhancements).
- __Sublime CodeIntel__:
    + __Description__: A full-featured code intelligence and smart autocomplete engine for Sublime Text. Supports: JavaScript, Mason, XBL, XUL, RHTML, SCSS, Python, HTML, Ruby, Python3, XML, XSLT, Django, HTML5, Perl, CSS, Twig, Less, Smarty, Node.js, Tcl, TemplateToolkit, PHP.
    + [GitHub](https://github.com/SublimeCodeIntel/SublimeCodeIntel).
    + [Homepage](http://sublimecodeintel.github.io/SublimeCodeIntel/).
- __Table Editor__:
    + __Description__: Table Editor is a package for the Sublime Text 2 and Sublime Text 3 editor for edit text tables. Table Editor is has almost the same keys as Emacs-org mode table editor.
    + [GitHub](https://github.com/vkocubinsky/SublimeTableEditor).
- __Terminal__:
    + __Description__: Shortcuts and menu entries for opening a terminal at the current file, or the current root project folder in Sublime Text.
    + [GitHub](https://github.com/wbond/sublime_terminal).
    + [Homepage](http://wbond.net/sublime_packages/terminal).
- __Trailing Spaces__:
    + __Description__: A Sublime Text 2 and 3 plugin that allows you to highlight trailing spaces and delete them in a flash!.
    + [GitHub](https://github.com/SublimeText/TrailingSpaces).
- __View In Browser__:
    + __Description__: Sublime Text plugin that will open whatever is in your current view/tab. If the file current open is new and has not been saved a temporary file is created (in your default temp directory for your OS) with the extension of .htm and your browser will open it. However if the current open file is saved and has a name this plugin will open it in whatever you have set to handle its type.
    + [GitHub](https://github.com/adampresley/sublime-view-in-browser).

## Installation.
There are two posible ways to install this list of plugins:

#### Manual installation (one-by-one):
Open SublimeText _Command Palette_:
 - `cmd + shift + p` in MacOSX.
 - `ctrl + shift + p` in Linux and Windows.

Choose:

>Package Control: Install Package

Then type and select the name of the plugin and press `ENTER` to install.

#### Automatic installation:
Copy my _Package Control.sublime-settings_ in:

>"SublimeTextPath"/Package/User

The next time you open Sublime Text it will install missing packages.

__WARNING__: If you have already installed other plugins, don't overwrite the file. Just add my plugins list to you personal list.

```json
{
    "in_process_packages":
    [
    ],
    "installed_packages":
    [
        "Auto Semi-Colon",
        "C Improved",
        "Djaneiro",
        "DocBlockr",
        "Dotfiles Syntax Highlighting",
        "Git",
        "GitGutter",
        "MacTerminal",
        "Markdown Preview",
        "MarkdownEditing",
        "OmniMarkupPreviewer",
        "Package Control",
        "PackageResourceViewer",
        "PlainTasks",
        "Project Manager",
        "Prolog",
        "ScopeHunter",
        "SideBarEnhancements",
        "SublimeCodeIntel",
        "Table Editor",
        "Theme - Cobalt2",
        "TrailingSpaces",
        "View In Browser"
    ]
}
```


---
__Author:__ _Jesús Martínez-Barquero Herrada_

__Last updated:__ _23/03/2015_