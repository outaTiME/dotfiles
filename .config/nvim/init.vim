call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'othree/yajs.vim'
" Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'qpkorr/vim-bufkill'
Plug 'Asheq/close-buffers.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'djoshea/vim-autoread'
Plug 'ntpeters/vim-airline-colornum'
" Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
" Plug 'mxw/vim-jsx'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
" Plug 'RRethy/vim-illuminate'
" Plug 'svermeulen/vim-easyclip'
" Plug 'liuchengxu/vim-clap'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'sickill/vim-pasta'

call plug#end()

" Mappings {{
let mapleader="\<Space>"
" let mapleader=","
" no arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
" }}

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
nnoremap <leader>n :NERDTreeToggle<cr>
" map <C-n> :NERDTreeToggle<CR>
" nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" }}

" FZF {{
" nnoremap <C-p> :Files<CR>
" nnoremap <C-t> :Files<CR>
" nnoremap <Leader>f :Rg<CR>
" nnoremap <Leader>b :Buffers<CR>
" nnoremap <Leader>h :History<CR>
" nnoremap <C-r> :History<CR>
" nnoremap <Leader>t :BTags<CR>
" nnoremap <Leader>T :Tags<CR>
" nnoremap <Leader>l :BLines<CR>
" nnoremap <Leader>L :Lines<CR>

" Terminal buffer options for fzf
" autocmd! FileType fzf
" autocmd  FileType fzf set noshowmode noruler nonu

" if has('nvim') || has('gui_running')
"   let $FZF_DEFAULT_OPTS .= ' --inline-info'
" endif

" All files
" command! -nargs=? -complete=dir AF
"   \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
"   \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
"   \ })))

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" https://github.com/junegunn/dotfiles/blob/master/vimrc#L1688
" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
" nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>l        :BLines<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>'        :Marks<CR>
nnoremap <silent> <Leader>h        :History<CR>
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   if a:fullscreen
"     let options = fzf#vim#with_preview(options)
"   endif
"   call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
" endfunction

" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <Leader>rg       :Rg<CR>
nnoremap <silent> <Leader>RG       :Rg!<CR>

" https://github.com/junegunn/fzf.vim#global-options
" let g:fzf_colors = {
"   \ 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment']
"  \ }

" }}

" COC {{
let g:coc_global_extensions = [
  \ "coc-css",
  \ "coc-eslint",
  \ "coc-html",
  \ "coc-json",
  \ "coc-prettier",
  \ "coc-tsserver",
  \ "coc-pairs",
  \ ]
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
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
" let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'json': ['prettier'],
  \ 'less': ['prettier'],
  \ }
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}

" NERD Commenter {{
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
" }}

" Theme {{
set termguicolors
" let g:onedark_termcolors=256
let g:onedark_terminal_italics = 1
let g:airline_colornum_reversed = 1
let g:onedark_hide_endofbuffer = 1
let g:onedark_color_overrides = {
  \ "black": { "gui": "#000000", "cterm": "0", "cterm16": "0" }
  \ }
colorscheme onedark
let g:airline_theme='onedark'
" }}

" Airline {{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
"}}

" EasyClip {{
" nnoremap gm m
" let g:EasyClipAutoFormat = 1
" }}

" Bufkill {{
" let g:BufKillOverrideCtrlCaret = 1
" }}

" indentLine {{
" let g:indentLine_color_term = 239
" let g:indentLine_color_gui = '#616161'
" }}

" Behavior {{
" Enable line numbers
set number
" set nonumber
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
" set autoindent
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
set cursorline
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
" Better display for messages
" set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
" don't give |ins-completion-menu| messages.
" set shortmess+=c
set visualbell
" set colorcolumn=80
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
" let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
" set foldmethod=indent
" set wildoptions=pum
" set pumheight=15
" set lazyredraw
" }}

" https://github.com/lukas-reineke/dotfiles/blob/master/vim/init.vim#L144
" Fold {{{

" set foldclose=all
" set nofoldenable
" set foldlevel=2
" set foldmethod=indent
" set foldnestmax=2
" set foldopen=all
" set foldminlines=0

" }}}

" Chars {{{

set list
" set listchars=eol:↴
set listchars+=tab:>-
set listchars+=trail:•
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=nbsp:_
set listchars+=space:⋅
set showbreak=↳⋅
set conceallevel=2
set concealcursor=n
" let g:indentLine_char = '│'
" let g:indentLine_first_char = g:indentLine_char
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_color_gui = onedark#GetColors().cursor_grey.gui
" let g:indentLine_bgcolor_gui = 'NONE'
" let g:indentLine_setConceal = 0
" let g:indentLine_fileTypeExclude = ['help', 'defx', 'vimwiki']
" let g:indentLine_autoResetWidth = 0
" let g:indent_blankline_space_char = ' '

" augroup IndentBlankline
"     autocmd!
"     autocmd User ALEFixPost IndentBlanklineRefresh
" augroup END

" }}}

" Automatic commands {{
" https://github.com/junegunn/fzf/issues/453#issuecomment-513495518
" au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif
"}}
