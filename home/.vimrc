set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'

call vundle#end()

" general settings
syntax off
set encoding=utf-8
set relativenumber
set hlsearch
set smartindent

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" colors
"set background=dark

" ctrlp
let g:ctrlp_map = '<C-P>'

" custom mappings
map <S-J> :tabprev<CR>
map <S-K> :tabnext<CR>
map <S-T> :tabnew<CR>
map <S-W> :tabclose<CR>

map <C-J> :bprevious<CR>
map <C-K> :bnext<CR>
map <S-W> :bclose<CR>

filetype plugin on
