#!/bin/bash
# install workgroups
cd ~/.emacs.d
git clone git://github.com/tlh/workgroups.el
cd workgroups.el
git fetch
git merge origin
echo "(add-to-list 'load-path \"~/.emacs.d/workgroups.el\")" >> ~/.emacs
echo "(require 'workgroups)" >> ~/.emacs
echo "(setq wg-prefix-key (kbd \"C-c w\"))" >> ~/.emacs
echo "(workgroups-mode 1)" >> ~/.emacs
echo "(wg-load \"~/.emacs.d/workspaces\")" >> ~/.emacs
