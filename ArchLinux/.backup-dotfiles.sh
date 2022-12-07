#!/usr/bin/env sh

cp ~/.* ~/GitHub/Dotfiles/ArchLinux/
cp -rf ~/.config ~/GitHub/Dotfiles/ArchLinux/
cp -rf ~/.vim ~/GitHub/Dotfiles/ArchLinux/
# cp -rf ~/.emacs.d ~/GitHub/Dotfiles/ArchLinux/
cp -rf ~/.doom.d ~/GitHub/Dotfiles/

cd ~/GitHub/Dotfiles/ArchLinux
git add *
git add .*
git commit -m "Automatic Dotfile Backup $(date +%Y-%m-%d), $(date +%H:%M)"
git push
