source ~/.vim/vundle.vim

" Encoding dectection
set fileencodings=utf-8

" Enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" Enable syntax hightlight and completion
syntax on

" Highlight current line
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" Search
set incsearch			" While typing a search command, show immediately where the so far typed pattern matches.
" set highlight 			" Conflict with highlight current line.
set ignorecase			" Ignore case in search patterns.
set smartcase			" Override the 'ignorecase' option if the search pattern contains upper case characters.

" Editor settings
set history=1000
set nocompatible
set nofoldenable						" Disable folding.
set confirm								" Prompt when existing from an unsaved file.
set backspace=indent,eol,start			" More powerful backspacing.
set t_Co=256							" Explicitly tell vim that the terminal has 256 colors.
set mouse=a								" Use mouse in all modes.
set report=0							" Always report number of lines changed.
set scrolloff=5							" 5 lines above/below cursor when scrolling.
set number								" Show line numbers.
" set relativenumber						" Show relativenumber.
set showmatch							" Show matching bracket (briefly jump).
set showcmd								" Show typed command in status bar.
set title								" Show file in titlebar.
set laststatus=2						" Use 2 lines for the status bar.
set matchtime=2							" Show matching bracket for 0.2 seconds.
" set directory=~/tmp,/tmp					" Move swp file to /tmp.

" Default Indentation
set autoindent				" Copy indent from current line when starting a new line.
set expandtab				" Use the appropriate number of spaces to insert a <Tab>.
set smartindent
set tabstop=4				" 4 spaces that a <Tab> in the file counts for.
set softtabstop=4
set shiftwidth=4			" 4 spaces to use for each step of (auto)indent.
" set textwidth=79				" 79 width of text that is being inserted.
" set smarttab					" Insert tabs on the start of a line according to shiftwidth, not tabstop.
