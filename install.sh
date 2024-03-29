#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

profile="${1}"

ln -sf ${DIR}/.zshrc ~/.zshrc
ln -sf ${DIR}/.zshenv ~/.zshenv
ln -sf ${DIR}/.gitignore ~/.gitignore
ln -sf ${DIR}/.vim ~/.vim
ln -sf ${DIR}/.vimrc ~/.vimrc
ln -sf ${DIR}/.ackrc ~/.ackrc
ln -sf ${DIR}/.gemrc ~/.gemrc
ln -sf ${DIR}/.rspec ~/.rspec
ln -sf ${DIR}/.tmux.conf ~/.tmux.conf
ln -sf ${DIR}/.tool-versions ~/.tool-versions
ln -sf ${DIR}/.doom.d ~/.doom.d
ln -sf ${DIR}/.p10k.zsh ~/.p10k.zsh

mkdir -p ~/.config/alacritty
ln -sf ${DIR}/alacritty.toml ~/.config/alacritty/alacritty.toml

ln -sf ${DIR}/.gitconfig ~/.gitconfig

profiles_dir=~/.akj_profiles
mkdir -p ${profiles_dir}
if [[ -n $profile ]]; then
    ln -s "${DIR}/profiles/zshrc_${profile}.sh" "${profiles_dir}"
fi;
