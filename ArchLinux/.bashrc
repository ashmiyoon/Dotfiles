#!/usr/bin/env bash

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


### MY CUSTOM CONFIG STARTS HERE

# Sets PATH variable
export PATH=$PATH:$HOME/.emacs.d/bin

# Easily start Emacs from the terminal
alias ec='nohup emacsclient -a \'vim' -c --alternate-editor="" & exit'

# Generates a new Bitwarden password, defaults to 20 chars long
genpw() {
  if [ $# -eq 0 ]
  then
    rbw gen 20 | tr -d '\n' | xclip -sel clip
  else
    rbw gen $1 | tr -d '\n' | xclip -sel clip
  fi
}

# Retrives a password from Bitwarden
getpw() {
  rbw sync
  rbw get $* | tr -d '\n' | xclip -sel clip
}

# Script to sanitize filenames
# Stolen from https://serverfault.com/a/776229
sanitize() {
  shopt -s extglob;

  filename=$(basename "$1")
  directory=$(dirname "$1")

  filename_clean=$(echo "$filename" | sed -e 's/[\\/:\*\?" ~<>\|\x01-\x1F\x7F]//g' -e 's/^\(nul\|prn\|con\|lpt[0-9]\|com[0-9]\|aux\)\(\.\|$\)//i' -e 's/^\.*$//' -e 's/^$/NONAME/')

  if (test "$filename" != "$filename_clean")
  then
    mv -v "$1" "$directory/$filename_clean"
  fi
}
export -f sanitize
sanitize_dir() {
  find "$1" -depth -exec bash -c 'sanitize "$0"' {} \;
}

# Deletes stuff temporarily by moving it to a `.Trash` folder
function del() {
  mv $* ~/.Trash
}

