set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Keep Plugin commands between vundle#begin/end.
 Plug 'tpope/vim-fugitive'
 Plug 'jiangmiao/auto-pairs'
 "Bar
 Plug 'itchyny/lightline.vim'     
 "Themes
 "Plug 'chriskempson/base16-vim'
 "Plug 'nanotech/jellybeans.vim'
 "Plug 'wojciechkepka/vim-github-dark'
 Plug 'sainnhe/edge'
 Plug 'dracula/vim'
 Plug 'epmor/hotline-vim'
 Plug 'w0ng/vim-hybrid'
 Plug 'joshdick/onedark.vim'

 "LSP
 Plug 'neovim/nvim-lspconfig'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}


 Plug 'preservim/nerdtree'
 Plug 'nvim-lua/completion-nvim'
 Plug 'sheerun/vim-polyglot'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
 Plug 'junegunn/fzf.vim'
 Plug '~/.fzf'
" All of your Plugins must be added before the following line
call plug#end()
 filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"Set number command at start up
set number relativenumber
  
" Set syntax highlighting on
syntax on
 
" Set colorscheme
"colorscheme ghdark
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme onedark
set nocursorline

"hi Normal guibg=NONE ctermbg=NONE
"hi LineNr guibg=NONE ctermbg=NONE
"hi SignColumn guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE


highlight LineNr guibg=NONE

set mouse=a
set ts=4 sw=4 sts=4
set smartindent
set expandtab
set ai

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'component': {
      \   'filename': '%F',
      \ }
      \ }

"Fixing stuff
set laststatus=2

"Terminal colors 256
set t_Co=256
let g:rehash256 = 1
set background=dark
"set termguicolors

set completeopt-=preview

set nobackup
set noswapfile
set nowritebackup
let g:loaded_matchparen=1

"FZF CONFIGS
" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>

let g:python_highlight_space_errors = 0

"Syntax
hi Error NONE
hi ErrorMsg NONE


"se cul
"hi clear CursorLineNr
hi cursorlinenr guifg=orange term=bold cterm=bold ctermfg=012 gui=bold

"templates
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp



" LSP stuff
"
lua << EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach = require'completion'.on_attach
}

local nvim_lsp = require('lspconfig')
local on_attach = function(_, bufnr)
require('completion').on_attach()
local opts = { noremap=true, silent=true }
end
local servers = {'clangd', 'pyright', 'tsserver'}
for _, lsp in ipairs(servers) do
nvim_lsp[lsp].setup {
  on_attach = require'completion'.on_attach
}
end

EOF


" fix conflict between completion-nvim and autopairs
let g:completion_confirm_key = ""
inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


nnoremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

"Compile function
function GetFileType()
    let curr_file = &filetype
    if curr_file ==# "cpp"
        return ":!g++ -o %:r % -std=c++11 && ./%:r"
    endif
    if curr_file ==# "python"
        return ":!python3 %"
    endif
    if curr_file ==# "c"
        return ":!gcc -o %:r % && ./%:r"
    endif
    if curr_file ==# "java"
        return ":!java %"
    endif
    if curr_file ==# "html"
        return ":!brave %"
    endif
    if curr_file ==# "tex"
        return ":!pdflatex % && mupdf %:r.pdf"
endfunction

nnoremap <C-x> :<C-R>= GetFileType()<CR> <Enter>
nnoremap <C-z> <Enter>

"set guicursor =i:block

let b:coc_diagnostic_disable = 1


