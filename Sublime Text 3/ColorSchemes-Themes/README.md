#List of Color Shemes and Themes
All these Color Schemes and Themes are used by settings file ([here](https://github.com/JesusMtnez/configs/tree/master/Sublime%20Text%203/Settings-Keys)).
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
- **Cobalt2 Theme/Color Scheme**:
    + **Description**: A Sublime Text theme based on our old blue friend cobalt. A refined colour scheme that is easy on the eyes and takes small UI elements into account. Includes full sublime theme (sidebar, search, tabs, etc...) as well as support for SublimeLinter, git diffing and a growing number of plugins.
    + [GitHub](https://github.com/wesbos/cobalt2).

### Not avaliable in Package Control.
Copy these files in 'Packages/User'. All the files are avaliable in this repository.
- **Batman Color Scheme**:
    + **Description**: Use for XML files.
    + [Homepage](http://colorsublime.com/theme/Batman).
- **Cobaltish Color Scheme**:
    + **Description**: Cobalt2 Color Sheme for Markdown files.
    + [Homepage](http://www.movingelectrons.net/blog/2014/12/19/cobaltish-color-scheme-for-markdownediting-plugin-sublime-text).

---
**Author:** *Jesús Martínez-Barquero Herrada*

**Last updated:** _18/02/2015_