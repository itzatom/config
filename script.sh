#!/bin/sh

#install zsh, gawk, fzy, vim AT LEAST

BACKUPFOLDER=$PWD/backup
DOTCONFIG=$PWD/dotfiles/dotconfig
DOTHOME=$PWD/dotfiles/dothome

mkdir $BACKUPFOLDER

#Backing up file in .config folder
cd $DOTCONFIG
for dotfile in $(ls);
do
    tmp="$HOME/.config/$dotfile"
    if [ -e "$tmp" ]; then
        mv $tmp $BACKUPFOLDER
    fi
done
#Creating symlink
for dotfile in $(ls)
do
   stow -v -t $HOME -R $dotfile
done

#Backing up dotfiles in home
cd $DOTHOME
for dotfile in $(ls);
do
    tmp="$HOME/.$dotfile"
    if [ -e "$tmp" ]; then
        mv $tmp $BACKUPFOLDER
    fi
done
#Creating symlink
for dotfile in $(ls)
do
   stow -v -t $HOME -R $dotfile
done

vim +PlugInstall +qall
