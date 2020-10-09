" A lot of these are from, with some modifications: https://www.youtube.com/watch?v=gZCXaF-Lmco
"
" A lot are also from ntsvetko

" Remap Leader key:
let mapleader = ","
nnoremap <silent> <leader> :WhichKey ','<CR>

" --- Function keys ---
set pastetoggle=<F2>
nnoremap <F5> :UndotreeToggle<cr>
nmap <F8> :TagbarToggle<cr>

" --- Generic mappings ---
" Remap jk to ESC in insert mode
inoremap jk <ESC>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt_hjkl to resize windows
nnoremap <M-j>  :resize -2<CR>
nnoremap <M-k>  :resize +2<CR>
nnoremap <M-h>  :vertical resize -2<CR>
nnoremap <M-l>  :vertical resize +2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
"toggle folds with space
nnoremap <space> zA

" --- File-type specific mappings ---

" python keybindings
au FileType python nnoremap <Leader>r :w<cr>:!python %<cr>

" tex keybindings
au FileType tex nnoremap <Leader>r :w<cr>:!pdflatex %<cr>

" --- Plugin mappings ---

" --- coc:

" <TAB> completion with coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" --- fzf:
nnoremap <leader>b :Buffers<cr>
nnoremap <c-o> :GFiles<cr>
nnoremap <c-p> :History<cr>
nnoremap <c-f> :Rg<Space>

" searches using ag for what is under the cursor (requires ag, fzf):
nnoremap <leader>f viwy:Rg <c-r>"<cr>

" --- easy-align
" (https://github.com/junegunn/vim-easy-align/blob/master/EXAMPLES.md)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

