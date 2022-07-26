set nocompatible              " be iMproved, required

" Syntax highlighting
syntax on

" --- Colors

" Change colour of autocomplete drop-down
"highlight Pmenu ctermbg=238 gui=bold

set background=dark

" --- Settings

set t_Co=256 " 256 color mode (sometimes tmux can be weird)
set t_ZH=[3m
set t_ZR=[23m

set hidden " open new buffer, keep current hidden if there are changes

" Tabsize is 2 spaces
set tabstop=2 shiftwidth=2 softtabstop=0 expandtab
set number relativenumber "show hybrid line numbers
"set cindent "autoindent
set smartcase "smart case matching
set mouse=a "allow mouse usage
set ruler "show line,col % in status bar
set autoindent "keep cursor at same indent level on newline
set showcmd " show current command

set updatetime=100
set backspace=2 " make backspace work like most other programs

set cursorline " highlight current line

" when using tabs, show indentation
set list lcs=tab:\|\

" --- File loading commands

" Recognise *.md files as markdown
au BufRead,BufNewFile *.md set filetype=markdown
" Recognise *.ino as arduino
au BufNewFile,BufRead *.ino set filetype=arduino
" Recognise Cython files
au BufRead,BufNewFile *.pyx set filetype=cython
" Noexpandtab on makefiles
autocmd FileType make setlocal noexpandtab

" IB uses 2-space indent
autocmd FileType python setlocal expandtab softtabstop=2 shiftwidth=2

" Run checktime every time the cursor is moved and settles for updatetime
" seconds
au CursorHold * checktime

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" ---- Keybindings ---

let mapleader = "," " remap Leader key

" Remap jk to ESC in insert mode
inoremap jk <ESC>

" Paste without breaking things
set pastetoggle=<F2>

highlight Comment cterm=italic

" use CLIPBOARD
noremap <Leader>y "+y
noremap <Leader>p "+p

set exrc
set secure
