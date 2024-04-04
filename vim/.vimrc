set encoding=utf-8
set clipboard=unnamedplus

syntax on

set rnu
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set wrap linebreak nolist
set smartcase
set noswapfile
set nobackup
set showtabline=2
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set tags=./tags;/
set diffopt+=vertical
set mouse=a

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delay time"
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set list
set listchars=tab:→\ ,extends:›,precedes:‹,nbsp:·,trail:␣,eol:¬

" Plugins
call plug#begin('~/.vim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vimwiki/vimwiki'

" Highlighted yank
Plug 'machakann/vim-highlightedyank'

call plug#end()

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

let g:highlightedyank_highlight_duration=150

set colorcolumn=80,120
hi ColorColumn ctermbg=0 guibg=lightgrey
hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic gui=italic
hi NonText guifg=#808080

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
" let g:netrw_localrmdir = 'rm -r'

let mapleader = " "

inoremap jk <ESC>

" Disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

nnoremap <leader>ff :FZF<cr>

nnoremap <leader>u :UndotreeShow<CR>

" Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y ggVG"+y

xnoremap <leader>p "_dP

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Keep the cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move text up and down
nnoremap <A-j> <cmd>m .+1<cr>==
nnoremap <A-k> <cmd>m .-2<cr>==
inoremap <A-j> <esc><cmd>m .+1<cr>==gi
inoremap <A-k> <esc><cmd>m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv
