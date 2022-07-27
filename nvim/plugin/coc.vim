" coc-specific settings
"
" Some servers have issues with backup files.
set nobackup
set nowritebackup

" More space for messages
set cmdheight=2

set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
