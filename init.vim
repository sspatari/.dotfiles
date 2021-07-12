filetype indent plugin on
syntax on

set path+=**
set background=dark
set regexpengine=0
set encoding=utf8
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set number
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set relativenumber
set clipboard=unnamed
set colorcolumn=80
set backspace=indent,eol,start
set cmdheight=2
set updatetime=300
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set splitbelow splitright
set cursorline
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin(stdpath('data') . '/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'jparise/vim-graphql'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
call plug#end()
colorscheme gruvbox

let mapleader = " "
nmap <leader>u :UndotreeShow<CR>
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFocus<CR>
nmap <silent> <Leader>v :NERDTreeFind<CR>
nmap <silent> <Leader>t :below terminal<CR>
nmap <silent> <Leader>= :vertical resize +5<CR>
nmap <silent> <Leader>- :vertical resize -5<CR>
tnoremap <Esc> <C-\><C-n>

" GIT
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" PLUGIN: FZF
nmap <silent> <Leader>c :Commits<CR>
nmap <silent> <Leader>b :Buffers<CR>
nmap <C-p> :GFiles<CR>
nmap <C-g> :Rg<CR>
let g:netrw_liststyle = 3
let g:netrw_winsize = 15
let g:netrw_banner = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 0 " close nerd tree when open a file
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowLineNumbers = 1
let g:airline_powerline_fonts = 1

" FZF + ripgrep will not consider filename as a match
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
let g:fzf_commits_log_options = '--graph --oneline --decorate --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" CoC Stuff
let g:coc_global_extensions = ['coc-prettier', 'coc-explorer', 'coc-eslint', 'coc-tsserver']
function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif
  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "ÈîôËØØ"
    call searchdecl(expand('<cword>'))
  endif
endfunction

" GoTo code navigation.
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd :call <SID>GoToDefinition()<CR>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>r <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" life saver binds
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y
vnoremap <leader>p "_dP
