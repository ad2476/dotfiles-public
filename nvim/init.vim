
" set the runtime path to include fzf and initialize vim-plug
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-sensible' " sensible vim defaults

" IDE-like functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'w0rp/ale' " syntax checking
Plug 'tpope/vim-fugitive' " git support for vim
Plug 'airblade/vim-gitgutter' " shows +/-/~ according to git
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify' " start screen

" Productivity tools
Plug 'scrooloose/nerdtree' " displays a tree of the folders
Plug 'mbbill/undotree' " Undo history visualizer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align' " easy align text
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Language-specific support
Plug 'JuliaEditorSupport/julia-vim' " julia support
Plug 'tikhomirov/vim-glsl' " syntax highlighting for GLSL
Plug 'fatih/vim-go' " plugin for golang
Plug 'rust-lang/rust.vim' " plugin for rust
"Plug 'python-mode/python-mode' " plugin for python
Plug 'sheerun/vim-polyglot' " collection of language packs for vim
Plug 'kalekundert/vim-coiled-snake' " code-folding for python
Plug 'Konfekt/FastFold'

" Visual/themeing
Plug 'edkolev/tmuxline.vim' " uses vim-airline theme to make tmux match
Plug 'vim-airline/vim-airline' " status line
Plug 'vim-airline/vim-airline-themes' " themes to make status line pretty
Plug 'Yggdroot/indentLine' " makes indentations more visible with lines
Plug 'noah/vim256-color' " 256 color themes for vim
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call plug#end() " Automatically executes filetype plugin indent on and syntax enable

" --- Colors

" Change colour of autocomplete drop-down
"highlight Pmenu ctermbg=238 gui=bold

"colorscheme gruvbox
"colorscheme desert
"colorscheme mango
colorscheme onehalfdark
set background=dark

set termguicolors

" --- Settings
exec 'source '.stdpath('config').'/settings.vim'

" --- File loading commands
"
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

" Run checktime every time the cursor is moved and settles for 4s
au CursorHold * checktime

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" ----- Plugin settings ----
" (See individual config files under plugin/)

" ---- Keybindings ---
exec 'source '.stdpath('config').'/mappings.vim'

" --- Other ---
highlight Comment cterm=italic
set secure
