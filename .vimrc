" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plugin 'flazz/vim-colorschemes'

Plugin 'altercation/vim-colors-solarized'
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme jellybeans

"Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'

filetype plugin indent on
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab

set number
set numberwidth=2
highlight LineNr ctermbg=NONE guibg=NONE
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermfg=DarkBlue ctermbg=NONE guifg=DarkBlue guibg=NONE

set textwidth=80
set colorcolumn=+1
highlight ColorColumn guibg=#121212 ctermbg=233

au BufNewFile *.c 0r ~/.vim/templates/c.c
