#!/bin/bash

# This script soft links every file from git repo
# to the right directory
# ATTENTION! ln used with -f flag, this will overwrite
# existing files.

# vim
ln -fs $PWD/vim/.vimrc ~/

# X11
ln -fs $PWD/X11/.xinitrc ~/
ln -fs $PWD/X11/.Xdefaults ~/

# scrpits
ln -fs $PWD/scripts/.lockscreen.sh ~/
ln -fs $PWD/scripts/.fehbg ~/

# i3
ln -fs $PWD/i3 ~/.config/

# i3status
ln -fs $PWD/i3status ~/.config/

# zsh
ln -fs $PWD/zsh/.zshrc ~/
