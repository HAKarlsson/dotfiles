" Basic settings and variables {{{
filetype plugin indent on
syntax on
set encoding=utf-8
set visualbell noerrorbells	" don't beep
set hlsearch incsearch		" highlight search and incremental search
set gdefault			" global replace by default
set wrap			" wrap lines
set linebreak                   " when wrapping, wrap at words
set nu                          " show line numbers
set foldlevel=99                " default foldlevel 1 to see headings
set nobackup noswapfile		" disable backup and swapfiles
set bg=light                    " set light background
set nocompatible ignorecase smartcase
set nocindent noautoindent nosmartindent indentexpr=	" disable autoindents
set tabstop=8 shiftwidth=8 expandtab                    " setup default tab/shift/expand
set showmode showcmd ttyfast
set guioptions=a
let mapleader="."
let maplocalleader=","
set foldmethod=marker
set shortmess=atI   " disable welcome screen
set nospell         " disable spellcheck
set spelllang=en    " spell language english
set scrolloff=8     " show 8 line above and below
set hidden          " allow hidden buffers
set mouse=a         " enable mouse support
" }}}
" Specific settings {{{
au BufReadPost,BufNewFile *.md,*.txt,*.tex setlocal spell wrap " spelling and wrapping for text
au BufReadPost,BufNewFile *.md setlocal conceallevel=2 " spelling and wrapping for text
" }}}
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'frazrepo/vim-rainbow'
Plug 'neovim/nvim-lspconfig'
Plug 'dpelle/vim-LanguageTool'
Plug 'justinmk/vim-syntax-extra'
call plug#end()
" }}}
" Plugin configurations {{{
let g:vimtex_view_method='zathura'
let g:rainbow_active=1
let g:languagetool_jar='~/Sources/languagetool/languagetool-commandline.jar'
" LSP settings {{{
lua << EOF
require'lspconfig'.ccls.setup{}
EOF
" }}}
" }}}
" Keyboard bindings {{{
" Visual {{{
" visual move
nmap j gj
vmap j gj
nmap k gk
vmap k gk
" toggle folds 
nnoremap <Space> za
vnoremap <Space> za
" reload vimrc
nmap <silent> <leader>rv :source ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
" show spaces
nmap <silent> <leader>s :set nolist!<CR>
" show line numbers
nmap <silent> <leader>l :set nonu!<CR>
" wrap lines
nmap <silent> <leader>w :set nowrap!<CR>
" hide search highlight
nmap <silent> // :nohlsearch<CR>
" }}}
" Buffer {{{
" C-h/j/k/l to move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Buffer management
map <Right> :bnext<CR>
imap <Right> <ESC>:bnext<CR>
map <Left> :bprev<CR>
imap <Left> <ESC>:bprev<CR>
" maximize only this window
nmap <silent> <leader>m :only<CR>
" vertical split
nmap <silent> <leader>v :bel :vne<CR>
" horizontal split
nmap <silent> <leader>f :bel :new<CR>
" close viewport buffer
nmap <silent> <leader>x :hid<CR>
" }}}
" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>
" }}}
