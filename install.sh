#!/bin/bash
VIMRC=.vimrc
VIM=.vim
PWD=$(pwd)

if [ -f ~/$VIMRC ];
then
	echo "you have your own .vimrc"
	echo "your .vimrc will be .vimrc.backup"
	mv ~/.vimrc ~/.vimrc.backup
else
	echo "You don't have your own .vimrc."
	echo "Now clear to install vimrc....proceed"
fi

if [ -d ~/$VIM ];
then
	echo "you have your own .vim plugins"
	echo "your .vim plugin directory will be .vim.backup"
	mv ~/.vim ~/.vim.backup
else
	echo "You don't have your own vim plugin"
	echo "Clear to install vim plugin directory"
fi

ln -s $PWD/.vimrc ~/$VIMRC
echo "Configuration file .vimrc installed"

ln -s $PWD/vim ~/$VIM
echo "Plugin directory .vim installed"
echo
echo "Install complete. Don't move, remove this repository"
