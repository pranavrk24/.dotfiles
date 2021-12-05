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
set noshowmode
set mouse=a
set list
set listchars=tab:→\ ,extends:›,precedes:‹,nbsp:·,trail:␣,eol:↵

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to
" noticeable delay time"
set updatetime=50

" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vimwiki/vimwiki'
Plug 'norcalli/nvim-colorizer.lua'

" Gitsigns
Plug 'lewis6991/gitsigns.nvim'

" Markdown files editing
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" LSP
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

lua require('radar')

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

set colorcolumn=80,120
hi ColorColumn ctermbg=0 guibg=grey
" hi SignColumn guibg=NONE
" hi CursorLineNR guibg=NONE
hi Normal guibg=NONE ctermbg=NONE
" hi NonText guibg=NONE
hi Comment cterm=italic gui=italic
hi SignColumn guibg=none
hi CursorLineNR guibg=none
hi NonText guibg=none
hi NonText guifg=#505050

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir = 'rm -r'

let mapleader = " "

" Disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Tab navigation
nnoremap th :tabprev<cr>
nnoremap tl :tabnext<cr>
nnoremap tn :tabnew<cr>

nnoremap <leader>u :UndotreeToggle<CR>

" Copying to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

xnoremap <leader>p "_dP

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Easier Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> :m .+1<CR>==
inoremap <C-k> :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Semicolon to go to command mode
nnoremap ; :
vnoremap ; :

tnoremap <Esc> <C-\><C-n>

" Lua snip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'


nnoremap <leader><CR> :source $MYVIMRC<CR>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" Highlighted yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
augroup END

lua require'colorizer'.setup()

lua << EOF

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    keymaps = {
      open = 'gtd' -- Opens the playground for current buffer (if applicable)
    },
    updatetime = 25 -- Debounced time for highlighting nodes in the playground from source code
  }
}

EOF
