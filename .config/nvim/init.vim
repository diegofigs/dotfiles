set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set smartcase

set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed

set relativenumber
set nu                      " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style

set mouse=a                 " enable mouse click
set mouse=v                 " middle-click paste with 
set clipboard=unnamedplus   " using system clipboard

filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mhinz/vim-startify'

call plug#end()

set completeopt=menu,menuone,noselect

lua require('diegofigs')

" open new split panes to right and below
set splitright
set splitbelow

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
inoremap ii <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

