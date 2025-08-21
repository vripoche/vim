call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'jxnblk/vim-mdx-js'
  Plug 'gpanders/editorconfig.nvim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'jackMort/ChatGPT.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'connorholyday/vim-snazzy'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'github/copilot.vim'
call plug#end()

set termguicolors
set expandtab
set tabstop=2
set shiftwidth=2
set number
set wildignorecase
set wildignore+=*/node_modules/*
set ignorecase
set smartcase
set clipboard=unnamed
set foldmethod=indent
set foldlevel=1
set foldnestmax=2
set noswapfile

lua <<EOF
require'colorizer'.setup()
require("chatgpt").setup({})
local cmp = require'cmp'
require'cmp'.setup{
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
  mapping = cmp.mapping.preset.insert{
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  }
}
vim.lsp.enable('biome')
-- enabled the Biome LSP.

-- Whenever an LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		-- When the client is Biome, add an automatic event on
		-- save that runs Biome's "source.fixAll.biome" code action.
		-- This takes care of things like JSX props sorting and
		-- removing unused imports.
		if client.name == "biome" then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("BiomeFixAll", { clear = true }),
				callback = function()
					vim.lsp.buf.code_action({
						context = {
							only = { "source.fixAll.biome" },
							diagnostics = {},
						},
						apply = true,
					})
				end,
			})
		end
	end,
})
EOF

nmap <C-a> :sball<CR>
xmap <C-a> :sball<CR>

nmap <C-g> :ChatGPT<CR>
xmap <C-g> "+y:<C-u>ChatGPT<CR><Esc>"+p"+a

nnoremap <C-p> :FZF<CR>
noremap <C-q> :bd<Cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let mapleader=","

colorscheme snazzy
