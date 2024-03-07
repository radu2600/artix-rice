set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Keep Plugin commands between vundle#begin/end.
 Plug 'junegunn/goyo.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'jiangmiao/auto-pairs'
 "Bar
 Plug 'itchyny/lightline.vim'     
 "Themes
 Plug 'epmor/hotline-vim'
 Plug 'joshdick/onedark.vim'
 Plug 'drsooch/gruber-darker-vim'
 Plug 'chriskempson/base16-vim'


 Plug 'preservim/nerdtree'
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
syntax enable
colorscheme GruberDarker

highlight LineNr guibg=NONE

set mouse=a
set ts=4 sw=4 sts=4
set smartindent
set expandtab
set ai

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component': {
      \   'filename': '%F',
      \ }
      \ }

"Fixing stuff
set laststatus=2

"Terminal colors 256
"set t_Co=256
"let g:rehash256 = 1
set background=light
set termguicolors

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


"Syntax
hi Error NONE
hi ErrorMsg NONE


se cul
"hi "clear CursorLineNr
hi cursorline cterm=NONE ctermbg=NONE
hi cursorlinenr guifg=orange term=bold cterm=bold ctermfg=012 gui=bold


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
endfunction

nnoremap <C-x> :<C-R>= GetFileType()<CR> <Enter>
nnoremap <C-z> <Enter>

"set guicursor =i:block
