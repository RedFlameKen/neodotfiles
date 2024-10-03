set nocompatible

filetype off

syntax on

"filetype plugin indent on set encoding=utf-8

set fileencoding=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set linebreak

set number
set relativenumber

set termguicolors
set hlsearch
set incsearch

set scrolloff=6
set laststatus=2

set updatetime=60

set ai
set si

set encoding=utf-8
set fileencoding=utf-8

let mapleader = " "

"vnoremap y "+y
"noremap y "+y

inoremap <C-BS> <C-w>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

noremap <leader>ee :Ex<CR>
noremap <leader>ef :FZF --preview cat\ {}<CR>

call plug#begin()
Plug 'srcery-colors/srcery-vim'
Plug 'rose-pine/vim'
call plug#end()

color srcery

let g:currentMode = {
	    \ 'n' : 'NORMAL',
	    \ 'i' : 'INSERT',
	    \ 'R' : 'REPLACE',
	    \ 'v' : 'VISUAL',
	    \ 'V' : 'VISUAL-LINE',
	    \ 'c' : 'COMMAND',
	    \ 's' : 'SELECT',
	    \ 'S' : 'SELECT-LINE',
	    \}
command Cmain :normal i
	    \#include <iostream><ENTER>
	    \<ENTER>
	    \using std::cin;<ENTER>
	    \using std::cout;<ENTER>
	    \using std::endl;<ENTER>
	    \using std::string;<ENTER>
	    \<ENTER>
	    \int main(){<ENTER>
	    \return 0;<ENTER>
	    \}<ESC>

set statusline=%2*\ %{g:currentMode[mode()]}\ %1*\ %f\ %m%r%=%3*\ %y\ %2*\ %3l:%-3c\ %P\ 

hi User1 ctermbg=darkgray ctermfg=white
hi User2 ctermbg=cyan ctermfg=black
hi user3 ctermbg=gray ctermfg=black
hi NORMAL guibg=NONE ctermbg=NONE

au BufNewFile,BufRead,BufReadPost .aliases set syntax=sh
au BufNewFile,BufRead,BufReadPost *.rasi set syntax=css

augroup auto_colorize
  autocmd!
  autocmd
        \ BufNewFile,BufRead,BufEnter,BufLeave,WinEnter,WinLeave,WinNew
        \ *.js,*.css,*.scss,*.sass,*.ini,*.rofi
        \ ColorHighlight
augroup END
