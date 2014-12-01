set nowrap
set number
set t_Co=256
" let g:solarized_termcolors=256
syntax enable
set background=dark
" colorscheme solarized
set tabstop=3 shiftwidth=3 expandtab

let g:slime_target = "tmux"

if &diff
   colorscheme ron
endif

hi Comment ctermfg=121

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My bundles below:
" Bundle 'jelera/vim-javascript-syntax'
" Bundle 'pangloss/vim-javascript'
" Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'marijnh/tern_for_vim'
" Bundle 'jpalardy/vim-slime'
Bundle 'scrooloose/nerdtree'
" Bundle 'altercation/vim-colors-solarized'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kien/ctrlp.vim'

" let g:syntastic_check_on_open=1
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview

" :let g:html_indent_inctags = "html,body,head,tbody"

" autocmd FileType html setlocal shiftwidth=2 tabstop=2
filetype plugin indent on



" dmenu file opening
" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>

