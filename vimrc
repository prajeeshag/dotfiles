let s:uname = system("uname -s")
if v:version >= 800
	call plug#begin('~/.vim_plugged')
	if $HOSTNAME =~ "elogin"
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"else
		"Plug 'davidhalter/jedi-vim'
	endif
	Plug 'junegunn/fzf', { 'do': 'bash install' }
	Plug 'junegunn/fzf.vim'
	Plug 'preservim/nerdcommenter'
	if $HOSTNAME =~ "elogin"
		Plug 'SirVer/ultisnips'
	endif
	Plug 'honza/vim-snippets'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-surround'
	"Plug 'Yggdroot/indentLine'
	Plug 'vim-airline/vim-airline'
	Plug 'mihaifm/bufstop'
	Plug 'tpope/vim-eunuch'
	Plug 'jiangmiao/auto-pairs'
	"Plug 'tmhedberg/SimpylFold'
	"colorschemes 
	Plug 'altercation/vim-colors-solarized'
	Plug 'morhetz/gruvbox'
	Plug 'jnurmine/Zenburn'
	Plug 'sjl/badwolf'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'adelarsq/vim-matchit'
	call plug#end()
endif

syntax on
set t_co=256
set background=dark
colorscheme gruvbox

set splitbelow
set splitright

set ts=2
set sts=2
set sw=2

set hidden
set nobackup
set nowritebackup
set nocompatible
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

" Highlight searches
set hlsearch

" Show the cursor position
set ruler

filetype plugin on
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
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let use_findent = 0 
let findent = "~/bin/findent"
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0


" force hjlk use
nnoremap <left>  :echoe "use h"<cr>
nnoremap <right> :echoe "use l"<cr>
nnoremap <up>    :echoe "use k"<cr>
nnoremap <down>  :echoe "use j"<cr>
inoremap <left>  <esc>:echoe "use h"<cr>
inoremap <right> <esc>:echoe "use l"<cr>
inoremap <up>    <esc>:echoe "use k"<cr>
inoremap <down>  <esc>:echoe "use j"<cr>


" quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l



set tags=tags

" For vim jump to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif
"--------------------------------------------------------------



"For proper colors in tmux
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
"--------------------------------------

if v:version >= 800

"fzf settings start
	nnoremap <silent> <c-p> :Files<CR>
	nnoremap <silent> <leader>b :Buffers<CR>
	let g:fzf_preview_window = ''
"fzf settings end



"coc settings start
	nmap <silent> <leader>j <plug>(coc-diagnostic-next)
	nmap <silent> <leader>k <plug>(coc-diagnostic-prev)
	xmap <silent> <leader>f <Plug>(coc-format-selected)
	nmap <silent> <leader>f <Plug>(coc-format-selected)

	let g:coc_global_extensions = [
				\'coc-markdownlint', 'coc-python', 'coc-explorer',
				\'coc-json', 'coc-texlab', 'coc-yaml', 'coc-clangd',
				\'coc-marketplace', 'coc-sh', 'coc-diagnostic', 'coc-html',
				\'coc-css', 'coc-tsserver', 'coc-vimtex'
				\]
"coc settings end


" bufstop settings start
	let g:BufstopAutoSpeedToggle = 1  
" bufstop settings end


" indentLine settings start

	"set list lcs=tab:\|\ 
	let g:indent_guides_guide_size = 1
	let g:indent_guides_color_change_percent = 3
	let g:indent_guides_enable_on_vim_startup = 1

" indentLine settings end
endif

let g:python_highlight_all = 1
