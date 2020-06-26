"General configuration-------------------------
syntax on
filetype on
filetype plugin indent on
set number
set ts=2
set nocompatible
set incsearch
set ignorecase
set expandtab
set shiftwidth=2
set softtabstop=2
set bs=2
set nowrap
set encoding=utf-8
set fileencoding=utf-8
set noswapfile
"set term=xterm-color
"set mouse=a
set clipboard=unnamed

"KeyMaps---------------------------------------
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
:imap ;; <Esc>
autocmd InsertLeave * if expand('%') != '' | update | endif

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <Esc>[A <Up>
map <Esc>[B <Down>
map <Esc>[C <Right>
map <Esc>[D <Left>

vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

inoremap jj <esc>
inoremap jk <esc>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add or remove your Bundles here:
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/The-NERD-Commenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mxw/vim-jsx'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ap/vim-css-color'
Plugin 'dense-analysis/ale'

call vundle#end()
filetype plugin indent on

" Required:
filetype plugin indent on

"Plugins Settings------------------------------
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0

set completeopt-=preview

if has('gui_running')
  set background=dark
  colorscheme solarized
endif

map  <F1> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.orig$','\.bak$','\.svn$', '\.git$']

let g:EasyMotion_do_mapping = 0 " Disable default mappings

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1
nmap <leader>d <Plug>(ale_fix)

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.?(git|hg|svn|node_modules)$'
