set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Keep Plugin commands between vundle#begin/end.
 Plug 'tpope/vim-fugitive'
 Plug 'git://git.wincent.com/command-t.git'
 Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
 Plug 'jiangmiao/auto-pairs'
 "Bar
 Plug 'itchyny/lightline.vim'     
 "Themes
 "Plug 'chriskempson/base16-vim'
 "Plug 'nanotech/jellybeans.vim'
 "Plug 'wojciechkepka/vim-github-dark'
 Plug 'sainnhe/edge'
 "CPP
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
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"Set number command at start up
set number relativenumber
  
" Set syntax highlighting on
syntax on
 
" Set colorscheme
"colorscheme ghdark
if has('termguicolors')
  set termguicolors
endif
let g:edge_style = 'aura'
let g:edge_enable_italic = 0
let g:edge_transparent_background = 1
let g:edge_disable_italic_comment = 1
colorscheme edge

highlight LineNr guibg=NONE

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
set background=dark
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

let g:python_highlight_space_errors = 0

"Syntax
hi Error NONE
hi ErrorMsg NONE


se cul
hi clear CursorLine
hi cursorlinenr guifg=orange term=bold cterm=bold ctermfg=012 gui=bold
"hi cursorlinenr guifg=orange guibg=black (am scos de sus)
"let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
"let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
"let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise


"set ttymouse=sgr
set guicursor=i:block
set guicursor+=a:blinkon0


"templates
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
