set encoding=utf-8

syntax on

set ignorecase
set smartcase
set backspace=indent,eol,start

set nostartofline
set ruler
set confirm

"set shiftwidth=4
"set tabstop=4
"set softtabstop=4
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

map Y y$
nnoremap <C-L> :nohl<CR><C-L>

set autoindent
set list
set listchars=tab:>-

set number
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


map <F5> :NERDTreeToggle<CR>
let g:floaterm_keymap_toggle = '<F12>'


" THIS IS MY VIM-PLUG STUFF

call plug#begin()

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" MY FZF INSTALL
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Floaterm
Plug 'voldikss/vim-floaterm'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ReactJS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Vimtex
Plug 'lervag/vimtex'
let g:vimtex_view_method = 'zathura'

" doom-one.vim
Plug 'romgrk/doom-one.vim'

" Initialize plugin system
call plug#end()
