#!/bin/bash
echo "                      .___      __    _____.__.__                      "
echo "                    __| _/_____/  |__/ ____\__|  |   ____   ______     "
echo "                   / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/     "
echo "                  / /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \      "
echo "                  \____ |\____/|__|  |__|  |__|____/\___  >____  >     "
echo "                       \/                               \/     \/      "
echo "                                                                       "
echo "            This repository contains personal dotfiles of lcristianiim."
echo "                         special thanks to Ionică Bizău                "
echo "                              - - - - - - - - - -                      "
echo ""

echo "Installing software-properties-common"
sudo apt install software-properties-common

echo "Adding ppa:git-core/ppa repository..."
sudo add-apt-repository ppa:git-core/ppa

echo "Update packages..."
sudo apt-get update

echo "Installing git..."
sudo apt-get install git

echo "Clonning the dotfiles repository from github ..."
git clone https://github.com/lcristianiim/dotfiles

echo "Entering in the downloaded folder."
cd dotfiles

echo "Installing VIM ..."
sudo apt install vim-nox

echo "Installing TMUX ..."
sudo apt install tmux

echo "Copying .vimrc ..."
cp vim/.vimrc ~/

echo "Copying user/.gitconfig ..."
cp user/.gitconfig ~/

echo "Copying tmux/.tmux.conf ..."
cp tmux/.tmux.conf ~/

echo "Installing Vundle ..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing NeoBundle ..."
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

echo "Installing NVM ..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

echo "Installing node with NVM ..."
nvm install node

echo "Installing java (default-jdk) ..."
sudo apt-get install default-jdk

echo "apt-cache search maven ..."
sudo apt-cache search maven

echo "Installing maven ..."
sudo apt-get install maven

echo "Finished. Cleaning up ..."
cd ..
rm -rf dotfiles
