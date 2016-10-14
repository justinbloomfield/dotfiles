syntax off
set number
set relativenumber
set nohlsearch
set scrolloff=1
set noundofile
set nobackup
set nowritebackup

execute plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/csv.vim'
Plug 'yuratomo/w3m.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tomtom/tcomment_vim'
Plug 'jamessan/vim-gnupg'
execute plug#end()

filetype plugin indent on
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let maplocalleader = ","
let mapleader = ";"
map <C-t> :NERDTreeToggle<CR>
nmap <leader>n :new<CR>
nmap <leader>v :vnew<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>h :wincmd h<CR>
nmap <leader>x :!python3 %:p<CR>
set clipboard=unnamedplus

"inoremap ii <Esc>
aug CSV_Editing
	au!
	au BufRead,BufWritePost *.csv :%ArrangeColumn
	au BufWritePre *.csv :%UnArrangeColumn
aug end
"map u1 :.w >> \/home/poq/var/irc/irc.unix.chat/\#unix/in<cr>dd
map <leader>s1 :.w >> \/home/poq/var/irc/im.codemonkey.be/sarahhodge/in<cr>dd
"map w1 :.w >> \$IRC_DIR\irc.unix.net\\#unix\in<cr>dd

let @b="yypVr─vy4p0r└$r┘yykPr┌$r┐j0i│ $a │"
