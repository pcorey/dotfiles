set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'https://github.com/tpope/vim-commentary'
Plugin 'chriskempson/base16-vim'
Plugin 'https://github.com/Raimondi/delimitMate'
Plugin 'https://github.com/Shougo/unite.vim'
Plugin 'https://github.com/Shougo/vimproc.vim'
Plugin 'https://github.com/elixir-lang/vim-elixir'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=" "
let g:ycm_server_keep_logfiles = 1

set number
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set background=dark
set textwidth=0 
set wrapmargin=0
set clipboard=unnamed
syntax enable

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<cr>
let g:ctrlp_map = '<leader>p'
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

nnoremap <leader>d <C-D>
nnoremap <leader>u <C-U>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

noremap <leader>w :q<cr>
nnoremap ; :
nnoremap : ;

nnoremap <leader>o :tabo<cr>
nnoremap <leader>t :tabnew#<cr>

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap kj <esc>

set laststatus=2

colorscheme base16-default

"set wildignore=.*
call unite#custom#profile('default', 'context', {
  \   'winheight': 10,
  \   'direction': 'dynamictop',
  \ })
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --smart-case'
let g:unite_source_grep_recursive_opt = ''
call unite#custom#source('file_rec/neovim', 'ignore_globs', ['.*', 'node_modules/**/*'])
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('buffer,file,file_rec,file_rec/neovim', 'sorters', 'sorter_selecta')

nnoremap <leader>f :Unite -start-insert  -default-action=tabswitch buffer file_rec/neovim:!<cr>

nnoremap <leader>g :Unite  -auto-preview -buffer-name=ag grep:.<cr>
