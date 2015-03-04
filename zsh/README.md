#zsh
## Pre-installation requirements (ONLY MacOSX)
In order to use zsh as your shell, you need to install a package manager. For MacOSX I suggest `brew`.
## Installing _zsh_
First of all, we need to install zsh in our computer (Linux or MacOSX).

**Linux** using _apt-get_:
```Bash
sudo apt-get install zsh
```

**MacOSX** using _brew_:
```Bash
brew install zsh
```
## Installing _oh-my-zsh_
After installing _zsh_, you can install _oh-my-zsh_ for extra features.

**Option 1:** _curl_
```Bash
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```
**Option 2:** _wget_
```Bash
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
```
Or follow the instructions **[here](https://github.com/robbyrussell/oh-my-zsh#manual-installation)**.
###Adding plugins
To install new plugins, just place the plugin in the following folder:
````
~/oh-my-zsh/plugins/
````
After that, just open zsh configuration file (`~/.zshrc`) and add the new plugin to the list:
```Bash
ZSH_THEME="ohmytheme"
```
###Customazing Themes
To use a personal theme just place the theme file (_ohmytheme.zsh-theme_) in the following folder:
```Bash
~/.oh-my-zsh/themes/
```
After that, just open zsh configuration file (`~/.zshrc`) and change:
```Bash
plugins=(git zsh-syntax-highlighting newPlugin)
```
##Plugins
Here you got my personal list of plugins.
- **Git**: Include git aliases and functions. Include in _oh-my-zsh_ by default.
- **zsh-syntax-highlighting**: Add highlighting to shell commands.
    + [Github](https://github.com/zsh-users/zsh-syntax-highlighting).

---
**Author:** *Jesús Martínez-Barquero Herrada*

**Last updated:** _04/03/2015_