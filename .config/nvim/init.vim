" =========================
" Basic Vim Settings
" =========================

colorscheme vim
" Enable line numbers
set number relativenumber

" Enable mouse support
set mouse=a

" Tabs and indentation
set ts=4 sw=4 sts=4
set expandtab
set smartindent
set ai

" UI and appearance
syntax on
filetype plugin indent on
set background=dark
set cursorline
set signcolumn=no
set laststatus=2

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Completion settings
set completeopt-=preview
hi CursorLine term=bold cterm=bold guibg=Grey40


" =========================
" Plugin Manager (vim-plug)
" =========================
call plug#begin()
" Essential plugins
Plug 'jiangmiao/auto-pairs'        " Auto-close brackets
Plug 'joshdick/onedark.vim'        " One Dark color scheme
Plug 'chriskempson/base16-vim'     " Base16 color schemes
Plug 'preservim/nerdtree'          " File tree

call plug#end()

" Optional tweaks
highlight LineNr term=bold ctermfg=DarkGrey
highlight CursorLineNr guifg=orange term=bold cterm=bold ctermfg=012 gui=bold

" =========================
" Key mappings
" =========================
" NERDTree toggle
nnoremap <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

