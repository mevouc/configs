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

set encoding=utf-8 fileencodings=

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plugin 'flazz/vim-colorschemes'

Plugin 'altercation/vim-colors-solarized'
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme jellybeans

Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
Plugin 'tpope/vim-commentary'

set hlsearch
highlight Search ctermfg=DarkBlue ctermbg=White guifg=DarkBlue guibg=White

filetype plugin indent on
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab

set cursorline
highlight CursorLine ctermbg=232 guibg=#080808

set number
set numberwidth=4
highlight LineNr ctermbg=Black guibg=Black
highlight Normal ctermbg=NONE guibg=NONE

set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=235 guibg=#262626

set number relativenumber

set list
set listchars=tab:··,trail:▒,eol:¬,nbsp:¤
highlight SpecialKey ctermfg=240 ctermbg=NONE guifg=#585858 guibg=NONE
highlight NonText ctermfg=240 ctermbg=NONE guifg=#585858 guibg=NONE

set mouse=a

map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

map <C-Y> 0df:dwi* <Esc>A: Here.<Esc><CR>0
