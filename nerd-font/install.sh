#!/bin/bash
# download font
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
# create font folder
mkdir -p ~/.local/share/fonts
# move to right location
mv *.ttf ~/.local/share/fonts/
# clean cache
echo "=========="
echo "Cleaning cache"
fc-cache -f -v
# display hack font
echo "=========="
echo "Listing installed font"
fc-list | grep Hack
echo "=========="
echo "Set font to gnome-terminal"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Hack Nerd Font:style=Regular 11"

