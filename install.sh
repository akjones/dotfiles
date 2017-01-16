#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf ${DIR}/.zshrc ~/.zshrc
ln -sf ${DIR}/.spacemacs ~/.spacemacs
ln -sf ${DIR}/.gitconfig ~/.gitconfig
ln -sf ${DIR}/.gitignore ~/.gitignore
ln -sf ${DIR}/.vim ~/.vim
ln -sf ${DIR}/.vimrc ~/.vimrc
ln -sf ${DIR}/.ackrc ~/.ackrc
ln -sf ${DIR}/.gemrc ~/.gemrc
ln -sf ${DIR}/.rspec ~/.rspec
ln -sf ${DIR}/.zazurc.json ~/.zazurc.json 
