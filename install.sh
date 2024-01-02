#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf ${DIR}/.zshrc ~/.zshrc
ln -sf ${DIR}/.zshenv ~/.zshenv
ln -sf ${DIR}/.gitconfig ~/.gitconfig
ln -sf ${DIR}/.gitignore ~/.gitignore
ln -sf ${DIR}/.vim ~/.vim
ln -sf ${DIR}/.vimrc ~/.vimrc
ln -sf ${DIR}/.ackrc ~/.ackrc
ln -sf ${DIR}/.gemrc ~/.gemrc
ln -sf ${DIR}/.rspec ~/.rspec
ln -sf ${DIR}/.tmux.conf ~/.tmux.conf
ln -sf ${DIR}/.tool-versions ~/.tool-versions
ln -sf ${DIR}/.doom.d ~/.doom.d

mkdir -p ~/.config/alacritty
ln -sf ${DIR}/alacritty.toml ~/.config/alacritty/alacritty.toml
