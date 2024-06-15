runtime! archlinux.vim
set nocompatible

filetype off

syntax on

filetype plugin indent on

set shiftwidth=4
set softtabstop=4
set linebreak

set number
set relativenumber

set ai
set si

set encoding=utf-8
set fileencoding=utf-8

vnoremap <C-c> "+y

inoremap <C-BS> <C-w>

inoremap [ []<left>
inoremap " ""<left>

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

set laststatus=2
set statusline=%2*\ %{g:currentMode[mode()]}\ %1*\ %f\ %m%r%=%3*\ %y\ %2*\ %3l:%-3c\ %P\ 

hi User1 ctermbg=darkgray ctermfg=white
hi User2 ctermbg=cyan ctermfg=black
hi user3 ctermbg=gray ctermfg=black

au BufNewFile,BufRead,BufReadPost .aliases set syntax=sh
au BufNewFile,BufRead,BufReadPost *.rasi set syntax=css

augroup auto_colorize
  autocmd!
  autocmd
        \ BufNewFile,BufRead,BufEnter,BufLeave,WinEnter,WinLeave,WinNew
        \ *.js,*.css,*.scss,*.sass,*.ini,*.rofi
        \ ColorHighlight
augroup END
