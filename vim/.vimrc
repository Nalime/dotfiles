" neovim configuration file
" Modified for vim

" Options
" :h 'nu' for help of option nu
" nu  number        rnu relativenumber
" ru  ruler
" so  scrolloff     hls hlsearch
" ts  tabstop       sw  shiftwidth
" et  expandtab     si  smartindent
" bg  background
set nu rnu ru so=5 hls ts=4 sw=4 et si bg=dark

" Column guide @ column 80
set cc=80
hi ColorColumn ctermbg=black

" Syntax highlighting
syn on

" Stop turning ({}) red in C/C++
let c_no_curly_error=1

" Also mute search highlights with CTRL-L
nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>

" Shortcuts for C/C++ brace constructs
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O

" Source .vimrc
nnoremap <F9> :so ~/.vimrc<CR>

" Edit .vimrc
nnoremap <F12> :e ~/.vimrc<CR>

" Backup
" You might want to do
" `mkdir -p ~/.vim/backups` first
" bk backup  bdir backupdir
set bk
set bdir=$HOME/.vim/backups

" Undo
" ul undolevels  udf undofile
set ul=999999 udf
