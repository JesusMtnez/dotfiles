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
_Work in progress._
###Customazing Themes
To use a personal theme just place the theme file (_ohmytheme.zsh-theme_) in the following folder:
```
~/.oh-my-zsh/themes/
```
After that, just open zsh configuration file (`~/.zshrc`) and change:
```Bash
ZSH_THEME="ohmytheme"
```

---
**Author:** *Jesús Martínez-Barquero Herrada*

**Last updated:** _02/03/2015_