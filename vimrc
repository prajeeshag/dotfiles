execute pathogen#infect()

set ts=2
set sts=2
set sw=2

set hidden
set nobackup
set nowritebackup
set nocompatible
set clipboard=unnamed
set wildmenu

let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Show “invisible” characters
set lcs=tab:▸\
set list

" Highlight searches
set hlsearch

" Show the cursor position
set ruler

syntax on
filetype plugin indent on

" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

set background=dark
colorscheme solarized
set t_co=256
call togglebg#map("<f5>")


set shortmess+=i
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
nmap q <nop>
set noerrorbells visualbell t_vb=


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:indent_guides_enable_on_vim_startup = 1

let use_findent = 0 
let findent = "~/bin/findent"
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

nnoremap <left>  :echoe "use h"<cr>
nnoremap <right> :echoe "use l"<cr>
nnoremap <up>    :echoe "use k"<cr>
nnoremap <down>  :echoe "use j"<cr>
" ...and in insert mode
inoremap <left>  <esc>:echoe "use h"<cr>
inoremap <right> <esc>:echoe "use l"<cr>
inoremap <up>    <esc>:echoe "use k"<cr>
inoremap <down>  <esc>:echoe "use j"<cr>

" quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nmap <silent> <leader>j <plug>(coc-diagnostic-next)
nmap <silent> <leader>k <plug>(coc-diagnostic-prev)
"nmap <silent> <leader>j <plug>(ale_next_wrap)
"nmap <silent> <leader>k <plug>(ale_previous_wrap)