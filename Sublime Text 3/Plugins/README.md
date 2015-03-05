#List of plugins
## Pre-installation.
Before begining, install **Package Control** for *Sublime Text 2/3*. To do so, just open the Sublime Text console (`` ctrl + ` `` or `Show > View console`) and paste the following code:

**Sublime Text 2**
```python
import urllib2,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) ); by = urllib2.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None; print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) if dh != h else 'Please restart Sublime Text to finish installation')
```

**Sublime Text 3**
```python
import urllib.request,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```
Or follow the instructions **[here](https://packagecontrol.io/installation)**.
## Installation.
### Avaliable in Package Control.
- **Auto Semi-Colon**:
    + **Description**: This plugin automatically moves a semi-colon to outside of the last bracket when pressed inside one of more pairs of brackets.
    + [GitHub](https://github.com/vivait/SublimeAutoSemiColon).
- **DocBlockr**:
    + **Description**: DocBlockr is a package for Sublime Text 2 & 3 which makes writing documentation a breeze. DocBlockr supports JavaScript (including ES6), PHP, ActionScript, Haxe, CoffeeScript, TypeScript, Java, Groovy, Objective C, C, C++ and Rust.
    + [GitHub](https://github.com/spadgos/sublime-jsdocs).
- **Dotfiles Syntex Highlighting**:
    + **Description**: Want ShellScript (Bash) syntax highlighting for your dotfiles? You're damn right you do!
    + [GitHub](https://github.com/mattbanks/dotfiles-syntax-highlighting-st2).
- **MacTerminal**:
    + **Description**:MacTerminal is a SublimeText plugin. It opens new Terminal tab (on current or new window if necessary). It's working with Terminal and iTerm.
    +  [GitHub](https://github.com/afterdesign/MacTerminal).
- **MarkdownEditing**:
    + **Description**: Markdown plugin for Sublime Text. Provides a decent Markdown color scheme (light and dark) with more robust syntax highlighting and useful Markdown editing features for Sublime Text. 3 flavors are supported: Standard Markdown, GitHub Flavored Markdown (GFM), MultiMarkdown.
    + [GitHub](https://github.com/SublimeText-Markdown/MarkdownEditing)
- **Markdown Preview**:
    + **Description**: Preview and build your markdown files quickly in your web browser from Sublime Text 2/3.
    + [GitHub](https://github.com/revolunet/sublimetext-markdown-preview).
- **OmniMarkupPreviewer**:
    + __Description__: OmniMarkupPreviewer is a plugin for both Sublime Text 2 and Sublime Text 3 that preview markups in web browsers. OmniMarkupPreviewer renders markups into htmls and send it to web browser in the backgound, which enables a live preview. Besides, OmniMarkupPreviewer provide support for exporting result to html file as well.
    + [GitHub](https://github.com/timonwong/OmniMarkupPreviewer).
- **Package Resource Viewer**
    + **Description**: Plugin to assist viewing and editing package resources in Sublime Text 2 and Sublime Text 3.
    + [GitHub](https://github.com/skuroda/PackageResourceViewer).
- **Plain Tasks**:
    + **Description**: An opinionated todo-list plugin for Sublime Text 2/3 editor.
    + [GitHub](https://github.com/aziz/PlainTasks).
-   **Scope Hunter**:
    +   **Description**: This is a simple plugin get the scope under the cursor(s) in Sublime Text. This is useful for plugin development.
    +   [GitHub](https://github.com/facelessuser/ScopeHunter).
- **SideBar Enhancements**:
    + **Description**: Provides enhancements to the operations on sidebar of files and folders for Sublime Text.
    + [GitHub](https://github.com/titoBouzout/SideBarEnhancements).
- **Sublime CodeIntel**:
    + **Description**: A full-featured code intelligence and smart autocomplete engine for Sublime Text. Supports: JavaScript, Mason, XBL, XUL, RHTML, SCSS, Python, HTML, Ruby, Python3, XML, XSLT, Django, HTML5, Perl, CSS, Twig, Less, Smarty, Node.js, Tcl, TemplateToolkit, PHP.
    + [GitHub](https://github.com/SublimeCodeIntel/SublimeCodeIntel).
    + [Homepage](http://sublimecodeintel.github.io/SublimeCodeIntel/).
- **Table Editor**:
    + **Description**: Table Editor is a package for the Sublime Text 2 and Sublime Text 3 editor for edit text tables. Table Editor is has almost the same keys as Emacs-org mode table editor.
    + [GitHub](https://github.com/vkocubinsky/SublimeTableEditor).
- **Terminal**:
    + **Description**: Shortcuts and menu entries for opening a terminal at the current file, or the current root project folder in Sublime Text.
    + [GitHub](https://github.com/wbond/sublime_terminal).
    + [Homepage](http://wbond.net/sublime_packages/terminal).
- **Trailing Spaces**:
    + **Description**: A Sublime Text 2 and 3 plugin that allows you to highlight trailing spaces and delete them in a flash!.
    + [GitHub](https://github.com/SublimeText/TrailingSpaces).
- **View In Browser**:
    + **Description**: Sublime Text plugin that will open whatever is in your current view/tab. If the file current open is new and has not been saved a temporary file is created (in your default temp directory for your OS) with the extension of .htm and your browser will open it. However if the current open file is saved and has a name this plugin will open it in whatever you have set to handle its type.
    + [GitHub](https://github.com/adampresley/sublime-view-in-browser).

---
**Author:** *Jesús Martínez-Barquero Herrada*

**Last updated:** _20/02/2015_