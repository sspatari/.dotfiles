" Fundamentals "{{{
" ---------------------------------------------------------------------
" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
syntax enable
set number
set relativenumber
set title
set background=dark
set nobackup
set cmdheight=2
set scrolloff=10
set expandtab
set noswapfile
set clipboard=unnamed
set undodir=~/.nvim/undodir
set undofile
set lazyredraw
set colorcolumn=80
set splitbelow
set splitright
" Indents
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END
"}}}

" File types "{{{
" ---------------------------------------------------------------------
"autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------
" true color
if exists("&termguicolors") && exists("&winblend")
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  "runtime ./colors/NeoSolarized.vim "specify what color to import from colors
  colorscheme gruvbox
endif
"}}}

" Reload nvim config file
nnoremap <Leader>r :source $MYVIMRC<CR>
