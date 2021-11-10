#!/bin/bash

DOTFILES_DIR=`pwd`
BASE=`basename $DOTFILES_DIR`
if [ $BASE != 'dotfiles' ]; then
    echo "Idiot, run this script underneath dotfiles"
    exit
fi

if [ ! -f README.md ]; then
    echo "Moron, this appears not the dotfiles directory from Github.com"
    exit
fi


OLDDIR=~/dotfiles_old
DOTFILES="zshrc gvimrc vimrc svnrc gitconfig tmux.conf hgrc gitignore_global gitattributes"

echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

for file in ${DOTFILES[@]}; do
    if [ -e ~/.$file -a ! -h ~/.$file ]; then
        echo "Moving existing .$file from ~ to $OLDDIR"
        mv ~/.$file $OLDDIR
    fi

    echo "Creating symlink to $file in home directory."
    ln -sf $DOTFILES_DIR/$file ~/.$file
done

cp git_diff_wrapper /usr/local/bin/git_diff_wrapper && chmod +x /usr/local/bin/git_diff_wrapper

if [ -f /usr/bin/git ]; then
    git config --global core.excludesfile ~/.gitignore_global
    git config --global core.attributesfile ~/.gitattributes
fi

ln -sf $DOTFILES_DIR/nvim/* ~/.config/nvim/
