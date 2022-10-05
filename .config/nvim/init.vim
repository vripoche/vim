call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'w0rp/ale'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'jxnblk/vim-mdx-js'
  Plug 'gpanders/editorconfig.nvim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

let mapleader=","

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <C-a> :sball<CR>
xmap <C-a> :sball<CR>

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

set number
set wildignorecase
set wildignore+=*/node_modules/*
set ignorecase
set smartcase
set path=/Volumes/Workspaces/botify-report/**
set clipboard=unnamed
