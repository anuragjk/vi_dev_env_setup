#!/bin/sh

VERSION=0.0.0

echo "Begin $0 v$VERSION"

help(){
	echo " $0 HELP"
}

begin(){
	echo "Begin"

	if ! [ -x "$(command -v vim)" ]
	then
		echo "ERROR: Vim editor not installed"
		echo "Exiting..."
		exit
	fi
	echo "VIM editor found OK"

	# GIT
	if ! [ -x "$(command -v git)" ]
	then
		echo "Installing GIT..."
		apt-get install git -y
	fi
	echo "GIT installation OK"


	# cScope
	if ! [ -x "$(command -v cscope)" ]
	then
		echo "Installing Cscope..."
		apt-get install cscope -y
	fi
	echo "Cscope installation OK"

	# cTags
	if ! [ -x "$(command -v ctags)" ]
	then
		echo "Installing Ctags..."
	        apt-get install exuberant-ctags -y
	fi
	echo "Ctags installation OK"

	mkdir -p ~/.vim/autoload ~/.vim/bundle

	# Pathogen
	if ! [ -f ~/.vim/autoload/pathogen.vim ]
	then
		wget https://tpo.pe/pathogen.vim -P ~/.vim/autoload/
	fi
	echo "Pathogen installation OK"

	# NERDTree
	if ! [ -d ~/.vim/bundle/nerdtree ]
	then
		git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
	fi
	echo "NERDTree installation OK"

	# Changing .vimrc
	#cat <<EOT >> .vimrc
	printf '%s' '
" Install ctags and cscope
"
"  sudo apt-get install cscope exuberant-ctags
"
" Create list of all required files using find function on to tags.lst file
" Now use below commants to create cscope and ctags files
"
"  ctags -L tags.lst
"  cscope -i tags.lst
"
" Install Pathogen
" ---------------
"
"  mkdir -p ~/.vim/autoload ~/.vim/bundle
"  wget https://tpo.pe/pathogen.vim
"  cp pathogen.vim ~/.vim/autoload/
"
" Install NERDTree
" ----------------
"
"  git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
"
"
	execute pathogen#infect()
	nnoremap <C-n> :NERDTreeToggle<CR>

cs add cscope.out	" read out file
	
filetype on
filetype plugin on
filetype indent on
syntax on
	
set nocompatible
set number		" show line number
set cursorline		" Show curser line horizontal
set incsearch
set hlsearch		" Set search highlight
' >> ~/.vimrc
	
	echo "VIM startup configuration modified OK"

}

if [ $# -eq 0 ]
then
	begin
fi

