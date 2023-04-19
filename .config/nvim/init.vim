call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'w0rp/ale'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'jxnblk/vim-mdx-js'
  Plug 'gpanders/editorconfig.nvim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'neomake/neomake'
  Plug 'jackMort/ChatGPT.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
call plug#end()

lua <<EOF
-- chat gpt
require("chatgpt").setup({})
EOF

let mapleader=","

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <C-a> :sball<CR>
xmap <C-a> :sball<CR>

nmap <C-g> :ChatGPT<CR>
xmap <C-g> "+y:<C-u>ChatGPT<CR><Esc>"+p"+a

nnoremap <C-p> :FZF<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

noremap <C-q> :bd<Cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:ale_fixers = {
 \ 'javascript': ['prettier', 'eslint'],
 \ 'typescript': ['prettier', 'eslint'],
 \ 'javascriptreact': ['prettier', 'eslint'],
 \ 'typescriptreact': ['prettier', 'eslint'],
 \ }
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

set expandtab
set tabstop=2
set shiftwidth=2
set number
set wildignorecase
set wildignore+=*/node_modules/*
set ignorecase
set smartcase
set path=/Volumes/Workspaces/botify-report/**
set clipboard+=unnamed
