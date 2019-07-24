call plug#begin('~/.local/share/nvim/plugged')

" Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
" Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mhinz/vim-signify'
" Plug 'RRethy/vim-illuminate'
" Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'svermeulen/vim-easyclip'
" Plug 'ayu-theme/ayu-vim'

call plug#end()

" NERD Tree {{
" Show hidden files/directories
let g:NERDTreeShowHidden = 1
" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1
" Hide the Nerdtree status line to avoid clutter
" let g:NERDTreeStatusline = ''
" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]']
" Mappings
map <C-n> :NERDTreeToggle<CR>
" nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" }}

" FZF {{
nnoremap <C-p> :Files<CR>
nnoremap <C-t> :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
" nnoremap <C-r> :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>
" https://github.com/junegunn/fzf.vim#global-options
" let g:fzf_colors = {
"   \ 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment']
"   \ }
" }}

" COC {{
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}

" ALE {{
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ }
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}

" NERD Commenter {{
let g:NERDSpaceDelims = 1
" }}

" Theme {{
set termguicolors
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
let g:onedark_color_overrides = {
  \ "black": { "gui": "#000000", "cterm": "0", "cterm16": "0" }
  \ }
colorscheme onedark
" color dracula
" let g:lightline = {
"   \ 'colorscheme': 'onedark'
"   \ }
let g:airline_theme='onedark'
" let g:airline_theme='powerlineish'
" let ayucolor="dark"
" colorscheme ayu
" let g:airline_theme='ayu'
" }}

" Airline {{
let g:airline#extensions#tabline#enabled = 1
"}}

" Behavior {{
" Enable line numbers
set number
" Don't dispay mode in command line (airilne already shows it)
set noshowmode
" More natural split opening.
" set splitbelow
" set splitright
" filetype plugin indent on
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line<Plug>CocRefresh
" No swap file
set noswapfile
set nobackup
set nowritebackup
" Show Invisibles
set list
set listchars=tab:→→,eol:¬,space:.
" Hides buffers instead of closing them
set hidden
" ignore case when searching
set ignorecase
" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase
" do not wrap long lines by default
set nowrap
" set cursorline
" always show signcolumns
set signcolumn=yes
" set showmatch
" Yank and paste with the system clipboard
set clipboard=unnamed
" Ignores
" set wildignore+=*/tmp/*
" set wildignore+=*/build/*
" set wildignore+=*/node_modules/*
" set wildignore+=*/bower_components/*
" set wildignore+=package-lock.json
" set wildignore+=yarn.lock
" set wildignore+=.DS_Store
" set wildignore+=.expo
" Keep a minimum of 5 line below the cursor.
set scrolloff=5
" Keep a minimum of 5 columns left of the cursor.
set sidescrolloff=5
set autoread
" }}
