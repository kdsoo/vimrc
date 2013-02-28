#!/bin/bash
VIMRC=.vimrc
VIM=.vim
PWD=$(pwd)

function check_packages()
{
	type cscope &> /dev/null
	if [ "$?" -eq "0" ]
	then
		echo 'cscope OK'
	else
		echo '####################################################'
		echo 'cscope package required. Install cscope'
		echo '	sudo apt-get install cscope'
		echo '####################################################'
		exit $?
	fi

	type ctags &> /dev/null
	if [ "$?" -eq "0" ]
	then
		echo 'ctags OK'
	else
		echo '####################################################'
		echo 'ctags package required. Install ctags'
		echo 'sudo apt-get install ctags'	
		echo '####################################################'
		exit $?
	fi
}

function check_vimrc()
{
	if [ -f ~/$VIMRC ];
	then
		echo "you have your own .vimrc"
		echo "your .vimrc will be .vimrc.backup"
		mv ~/.vimrc ~/.vimrc.backup
	else
		echo "You don't have your own .vimrc."
		echo "Now clear to install vimrc....proceed"
	fi
}

function backup_your_vim()
{
	if [ -d ~/$VIM ];
	then
		echo "you have your own .vim plugins"
		echo "your .vim plugin directory will be .vim.backup"
		mv ~/.vim ~/.vim.backup
	else
		echo "You don't have your own vim plugin"
		echo "Clear to install vim plugin directory"
	fi
}

function vim_install()
{
	ln -s $PWD/.vimrc ~/$VIMRC
	echo "Configuration file .vimrc installed"

	ln -s $PWD/vim ~/$VIM
	echo "Plugin directory .vim installed"
	echo
	echo "Install complete. Don't move, remove this repository"
}

# Execute
check_packages
check_vimrc
backup_your_vim
vim_install
