#!/usr/bin/bash

DOTS_DIR="$(dirname $(realpath $0))"

ln -si $DOTS_DIR/.bash_profile ~/.bash_profile
ln -si $DOTS_DIR/.bashrc ~/.bashrc
ln -si $DOTS_DIR/.tmux.conf ~/.tmux.conf

if [[ ! -d ~/.config ]]
then
    mkdir ~/.config
fi

if [[ -e ~/.config ]]
then
    if [[ -L ~/.config/nvim ]]
    then
        rm ~/.config/nvim
    elif [[ -d ~/.config/nvim ]]
    then
        timestamp=$(date -Iseconds)
        mv ~/.config/nvim ~/.config/nvim.${timestamp}
    fi
fi

ln -si $DOTS_DIR/nvim -t ~/.config
