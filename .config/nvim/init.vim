" =========================
" Basic Vim Settings
" =========================

set number relativenumber

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

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

set notermguicolors
set title
set bg=light
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
colorscheme vim

" =========================
" NERDTree toggle
nnoremap <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

