" Pete Swetits
"
" Vundle config {{{
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" Spaces and Tabs {{{
set tabstop=4 " # spaces per tab (for displaying)
set softtabstop=4 " # spaces per tab (for editing)
set expandtab " turn tabs into spaces
" }}}
" UI Config {{{
set number " show line numbers
set showcmd " show last command in bottom bar
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when needed
set showmatch " highlight matching [{(
set incsearch " search as chars are entered
set hlsearch " highlight matches
" turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>
" always show status 
:set laststatus=2
" utf-8 encoding
set encoding=utf-8
" }}}
" Python specific {{{
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" virtualenv support
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
" }}} 
" Folding {{{
set foldenable " enable folding
set foldlevelstart=10 " fold after 10 nested levels
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
" Enable folding with the spacebar
nnoremap <space> za
" }}}
" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" unmap $/^
nnoremap ^ <nop>
nnoremap $ <nop>
" highlight last inserted text
nnoremap gV `[v`]
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Leader Shortcuts {{{
let mapleader="," " set leader to comma
" set / to ESC
inoremap jk <esc>
" edit vimrc and source
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>e :vert new
" save session
nnoremap <leader>s :mksession<CR>
"Remove all trailing whitespace
nnoremap <leader>rs :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" }}}
" Plugin settings {{{
" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
" NERDTree
map <C-n> :NERDTreeToggle<CR>
" YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}
" Colors {{{
colorscheme zenburn
syntax enable " enable syntax processing
" }}}
" vim:foldmethod=marker:foldlevel=0
