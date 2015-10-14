call pathogen#infect()
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin indent on
set grepprg=grep\ -nH\ $*
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
set cursorline
"set cursorcolumn

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

" LET vUNdle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mbbill/code_complete'
Bundle 'nuclearsandwich/vim-latex'
Bundle 'vim-scripts/tComment'
Bundle 'vlaadbrain/gnuplot.vim'
Bundle 'petRUShka/vim-sage'
Bundle 'holomorph/vim-freefem'

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor = "latex"


let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction nonstopmode $*'
"let g:Tex_ViewRule_pdf = 'apvlv'
let g:Tex_AutoFolding = 0
let g:Tex_Folding = 0


map <F5> :w !sudo tee %<cr>
syntax on
set background=dark
set modeline
set ls=2
set tabstop=2 
set shiftwidth=2
set smarttab
set expandtab
set number
set ruler
set hls
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set tw=300

set fileencodings=utf-8

au VimEnter * :IndentGuidesEnable

colorscheme ir_black
"colorscheme blackboard
"colorscheme elflord
"colorscheme wombat
"colorscheme solarized
" colorscheme skywalker
" colorscheme dark

let g:indent_guides_auto_colors = 0

nmap <F4> :IndentGuidesToggle<cr>
nmap <C-e> :e#<CR>

let g:Powerline_symbols = 'fancy'

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype sage
augroup END

hi Normal guibg=NONE ctermbg=NONE
