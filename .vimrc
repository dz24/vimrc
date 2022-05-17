set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle base plugin
Plugin 'VundleVim/Vundle.vim'
" Syntax
Plugin 'https://github.com/vim-syntastic/syntastic.git'
" Latex
Plugin 'https://github.com/lervag/vimtex.git'
" Autocompletion
Plugin 'https://github.com/ycm-core/YouCompleteMe.git'
" Surround
Plugin 'https://github.com/tpope/vim-surround.git'        
" Easymotion
Plugin 'https://github.com/easymotion/vim-easymotion.git'
call vundle#end()            " required
filetype plugin indent on    " required

" Easymotion map space to leader
nnoremap <SPACE> <Nop>
let mapleader=" "
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
map <Leader>l <Plug>(easymotion-bd-jk)

set tags=./tags,tags;$HOME
" set nu 
set incsearch

" source $VIMRUNTIME/vimrc_example.vim

filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/AutoComplPop'
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()


imap jk <ESC>
imap kj <ESC>
imap JK  <ESC>
imap KJ <ESC>

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set relativenumber
set nu rnu
set splitright

autocmd bufnewfile *log.txt so ~/.vim/sh_header.temp
autocmd bufnewfile *log.txt exe "1," . 5 . "g/File Name     :.*/s//File Name     : " .expand('%:t')
autocmd bufnewfile *log.txt exe "1," . 5 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d.%m.%y %H:%M:%S")
autocmd bufnewfile *log.txt exe "1," . 9 . "g/D :.*/s//" .strftime("%d.%m.%y %H:%M:%S:")
autocmd bufnewfile *log.txt exe "1," . 10 . "g/K :.*/s//" .strftime("")
autocmd Bufwritepre,filewritepre *log.txt execute "normal ma"
autocmd Bufwritepre,filewritepre *log.txt exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%d.%m.%y %H:%M:%S")
autocmd bufwritepost,filewritepost *log.txt execute "normal `a"

nmap <F3> i<C-R>=strftime("%d.%m.%y %H:%M:%S:")<CR><Esc>
imap <F3> <C-R>=strftime("%d.%m.%y %H:%M:%S:")<CR>

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR>


" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap , $p


function! NumberToggle()
  if(&rnu == 1)
    set nornu
  elseif(&nu == 1)
    set nornu
    set nonu
  else
    set rnu
    set nu
  endif
endfunc

"nmap <silent> <c-p> :call NumberToggle()<CR>
map <Leader>m :call NumberToggle()<CR>

set nostartofline
" Go to tab by number
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

" keep last position 
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Set highlight
set hlsearch

" enable indentation
set breakindent
