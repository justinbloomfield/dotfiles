syntax off
set nohlsearch
set scrolloff=1
set noundofile
set nobackup
set nowritebackup

execute plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/csv.vim'
Plug 'yuratomo/w3m.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tomtom/tcomment_vim'
Plug 'spolu/dwm.vim'
execute plug#end()

filetype plugin indent on
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let maplocalleader = ","
let mapleader = ";"
map <C-t> :NERDTreeToggle<CR>
set clipboard=unnamedplus
"inoremap ii <Esc>
aug CSV_Editing
	au!
	au BufRead,BufWritePost *.csv :%ArrangeColumn
	au BufWritePre *.csv :%UnArrangeColumn
aug end
map u1 :.w >> \/home/poq/var/irc/irc.unix.chat/\#unix/in<cr>dd
map <leader>s1 :.w >> \/home/poq/var/irc/im.codemonkey.be/sarahhodge/in<cr>dd

let @b="yypVr─vy4p0r└$r┘yykPr┌$r┐j0i│ $a │"
