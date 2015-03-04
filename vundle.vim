"
" Configure Vundle - the Vim plugin bundler
"

" Auto-installing Vundle
let vundle_installed=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle..."
	echo ""
	silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let vundle_installed=0
endif

set nocompatible	" be iMproved
filetype on         " required for compatibility with Mac OS X
filetype off		" required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let Vundle manage itself, required
Plugin 'gmarik/Vundle.vim'

" IDE features
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/Mark'

" Color schemes
Plugin 'tomasr/molokai'

filetype plugin indent on     " required!

" Auto-installing Plugins
if vundle_installed == 0
	echo "Installing Plugins..."
	echo ""
	:BundleInstall
endif

unlet vundle_installed
unlet vundle_readme
