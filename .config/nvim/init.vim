set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Keep Plugin commands between vundle#begin/end.
 Plug 'jiangmiao/auto-pairs'
 "Bar
 Plug 'itchyny/lightline.vim'     
 Plug 'joshdick/onedark.vim'
 Plug 'chriskempson/base16-vim'
 Plug 'preservim/nerdtree'
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
syntax enable
colorscheme base16-dracula
"colorscheme 256_noir
set nocursorline
set background=light

"hi Normal guibg=NONE ctermbg=NONE

"hi SignColumn guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE


set mouse=a
set ts=4 sw=4 sts=4
set smartindent
set expandtab
set ai


let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'component': {
      \   'filename': '%F',
      \ }
      \ }

"Fixing stuff
set laststatus=2

"Terminal colors 256
set t_Co=256
"let g:rehash256 = 1
set termguicolors

set completeopt-=preview

set nobackup
set noswapfile
set nowritebackup
let g:loaded_matchparen=1

"Syntax
hi Error NONE
hi ErrorMsg NONE


se cul
"hi clear CursorLineNr
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi cursorlinenr guifg=orange term=bold cterm=bold ctermfg=012 gui=bold


" fix conflict between completion-nvim and autopairs
let g:completion_confirm_key = ""
inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"

nnoremap <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

"
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
nnoremap <C-z> Enter>

"set guicursor =i:block

set signcolumn=no

