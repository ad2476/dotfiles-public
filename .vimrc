set nocompatible              " be iMproved, required
filetype off                  " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'w0rp/ale' " syntax checking
Plugin 'JuliaEditorSupport/julia-vim' " julia support
Plugin 'scrooloose/nerdtree' " displays a tree of the folders
Plugin 'edkolev/tmuxline.vim' " uses vim-airline theme to make tmux match
Plugin 'mbbill/undotree' " Undo history visualizer
Plugin 'vim-airline/vim-airline' " status line
Plugin 'vim-airline/vim-airline-themes' " themes to make status line pretty
Plugin 'tikhomirov/vim-glsl' " syntax highlighting for GLSL
Plugin 'fatih/vim-go' " plugin for golang
Plugin 'rust-lang/rust.vim' " plugin for rust
Plugin 'python-mode/python-mode' " plugin for python
Plugin 'junegunn/fzf.vim' " fzf commands

Plugin 'Yggdroot/indentLine' " makes indentations more visible with lines
Plugin 'tpope/vim-fugitive' " git support for vim
Plugin 'airblade/vim-gitgutter' " shows +/-/~ according to git

Plugin 'noah/vim256-color' " 256 color themes for vim

Plugin 'majutsushi/tagbar'

Bundle 'sonph/onehalf', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Syntax highlighting
syntax on

" --- Colors

" Change colour of autocomplete drop-down
"highlight Pmenu ctermbg=238 gui=bold

"colorscheme gruvbox
"colorscheme desert
colorscheme mango
set background=dark
"colorscheme onehalflight

" --- Settings

"set t_Co=256 " 256 color mode (sometimes tmux can be weird)
set t_ZH=[3m
set t_ZR=[23m

set noshowmode " let mode indicator be shown by vim-airline
set hidden " open new buffer, keep current hidden if there are changes
set ttymouse=xterm2 " let mouse work inside tmux

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
" Recognise Octave files
au BufRead,BufNewFile *.m,*.oct set filetype=octave
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

" ----- Plugin settings ----

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
let g:airline#extensions#tmuxline#enabled = 1

" command-t
"let g:CommandTFileScanner='git'
"let g:CommandTMaxFiles=200000
"let g:CommandTSuppressMaxFilesWarning=1

" Ale config
let g:ale_linters = {'cpp': ['clangtidy', 'clazy']}
let g:ale_fixers = {'cpp': ['trim_whitespace']}
let g:ale_list_window_size = 5
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fixers = {'*': ['trim_whitespace'], 'python': ['yapf']}
let g:ale_fix_on_save = 1

" python-mode config
let g:pymode_options_colorcolumn = 0
let g:pymode_indent = 0
let g:pymode_breakpoint = 0
let g:pymode_lint = 0
let g:pymode_lint_signs = 0

" fzf window statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" rust.vim
let g:rustfmt_autosave = 1

let g:indentLine_fileTypeExclude = ['tex']

" ---- Keybindings ---

let mapleader = "," " remap Leader key

" Undotree bindings
nnoremap <F5> :UndotreeToggle<cr>

" Remap jk to ESC in insert mode
inoremap jk <ESC>

" Paste without breaking things
set pastetoggle=<F2>
nmap <F8> :TagbarToggle<cr>

" python keybindings
au FileType python nnoremap <Leader>r :w<cr>:!python %<cr>

" tex keybindings
au FileType tex nnoremap <Leader>r :w<cr>:!pdflatex %<cr>

" fzf
nnoremap <leader>b :Buffers<cr>
nnoremap <c-o> :GFiles<cr>
nnoremap <c-p> :History<cr>
nnoremap <c-f> :Ag<Space>
" searches using ag for what is under the cursor (requires ag, fzf)
nnoremap <leader>f viwy:Ag <c-r>"<cr>

highlight Comment cterm=italic

" use CLIPBOARD
noremap <Leader>y "+y
noremap <Leader>p "+p

set pastetoggle=<F2>
nmap <F8> :TagbarToggle<cr>

set exrc
set secure
