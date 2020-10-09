
"set t_Co=256 " 256 color mode (sometimes tmux can be weird)
set t_ZH=[3m
set t_ZR=[23m

set noshowmode " let mode indicator be shown by vim-airline
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

"set backspace=2 " make backspace work like most other programs

set cursorline " highlight current line

" when using tabs, show indentation
set list lcs=tab:\|\

" coc-specific settings
" Some servers have issues with backup files.
set nobackup
set nowritebackup

" More space for messages
set cmdheight=2

set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Show signcolumn, otherwise it would shift the text
set signcolumn=yes

