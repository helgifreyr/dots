call pathogen#infect()
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin indent on
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

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':


let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction nonstopmode $*'
"let g:Tex_ViewRule_pdf = 'apvlv'
let g:Tex_AutoFolding = 0
let g:Tex_Folding = 0


autocmd FileType python map <F2> :!python %<cr>
map <F5> :w !sudo tee %<cr>
syntax on
set background=dark
set modeline
set ls=2
set tabstop=2 
set smarttab
set expandtab
set shiftwidth=2
set number
set ruler
set hls

set fileencodings=utf-8

au VimEnter * :IndentGuidesEnable

"colorscheme ir_black
"colorscheme blackboard
"colorscheme elflord
"colorscheme wombat
"colorscheme solarized
colorscheme skywalker

let g:indent_guides_auto_colors = 0

nmap <F4> :IndentGuidesToggle<cr>
nmap <C-e> :e#<CR>

let g:Powerline_symbols = 'fancy'

let g:Tex_Env_tikzgrid = "\\begin{tikzpicture}\<CR>\\draw[-stealth] (<+x1+>,0) -- (<+x2+>,0) node[right]{$<+x+>$};\<CR>\\draw[-stealth] (0,<+y1+>) -- (0,<+y2+>) node[above]{$<+y+>$};\<CR><++>;\<CR>\\end{tikzpicture}"
