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

echo "Installing git ..."
sudo pacman -S git

echo "Clonning the repository ..."
git clone https://github.com/lcristianiim/dotfiles

echo "Entering in the downloaded folder."
cd dotfiles

echo "Installing VIM ..."
sudo pacman -S vim

echo "Installing nodejs ..."
sudo pacman -S nodejs

echo "Copying .vimrc ..."
cp vim/.vimrc ~/

echo "Copying user/.bashrc ..."
cp user/.bashrc ~/

echo "Copying user/.gitconfig ..."
cp user/.gitconfig ~/

echo "Copying tmux/.tmux.conf ..."
cp tmux/.tmux.conf ~/

echo "Installing NeoBundle ..."
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

echo "Finished. Cleaning up ..."
cd ..
rm -rf dotfiles
