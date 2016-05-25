set nu
syntax off
set nohlsearch
set t_Co=0
set scrolloff=1
execute plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'jalvesaq/Nvim-R'
Plug 'jalvesaq/nvimcom'
" Plug 'vim-airline/vim-airline'
Plug 'chrisbra/csv.vim'
" Plug 'edkolev/tmuxline.vim'
Plug 'yuratomo/w3m.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
Plug 'spolu/dwm.vim'

execute plug#end()
filetype plugin indent on
"colorscheme base16-atelierlakeside
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let maplocalleader = ","
let mapleader = ";"
map <C-t> :NERDTreeToggle<CR>
let base16colorspace=256
set background=dark
set clipboard=unnamedplus
aug CSV_Editing
	au!
	au BufRead,BufWritePost *.csv :%ArrangeColumn
	au BufWritePre *.csv :%UnArrangeColumn
aug end
"oremap <C-l>

