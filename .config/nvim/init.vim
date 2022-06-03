" neovim configuration file

" How to create and edit init.vim:
" :call mkdir(stdpath('config'), 'p')
" :exe 'edit '.stdpath('config').'/init.vim'
" Usually located in ~/.config/nvim/init.vim

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

" Show tabs and trailing spaces
set list listchars=tab:»·,trail:·

" Syntax highlighting
syn on

" Stop turning ({}) red in C/C++
let c_no_curly_error=1

" Also mute search highlights with CTRL-L
nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>

" Shortcuts for C/C++ brace constructs
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O

" Source init.vim
nnoremap <F9> :exe 'source '.stdpath('config').'/init.vim'<CR>

" Edit init.vim
nnoremap <F12> :exe 'edit '.stdpath('config').'/init.vim'<CR>

" Backup
" You might want to do
" `mkdir -p ~/.local/share/nvim/backup` first
" bk backup  bdir backupdir
set bk
set bdir=$HOME/.local/share/nvim/backup

" Undo
" ul undolevels  udf undofile
set ul=999999 udf

" vim-plug
call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
}
EOF

" Notifys when loaded
echo 'init.vim loaded'
