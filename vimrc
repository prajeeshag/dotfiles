set ts=2
set sts=2
set sw=2

set hidden
set nobackup
set nowritebackup
set nocompatible
let mapleader=" "

execute pathogen#infect()
syntax on
filetype plugin indent on

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

set background=dark
colorscheme solarized
set t_Co=256
call togglebg#map("<F5>")


set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
nmap Q <Nop>
set noerrorbells visualbell t_vb=

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"nmap <silent> <Leader>j <Plug>(coc-diagnostic-next)
"nmap <silent> <Leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'sh': ['shfmt'],
\   'fortran': ['/home/cccr/prajeesh/miniconda3/bin/fprettify'],
\}
