set nocompatible
filetype off
"Install https://github.com/junegunn/vim-plug
call plug#begin()

" Update plugins with :PlugUpdate
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'udalov/kotlin-vim'
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#disable_rtp_load = 1 " to speed up startup
" let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

" Glug plugins
Plug 'airblade/vim-gitgutter'
let g:gitgutter_async=0
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/ConvertBase.vim'
Plug 'sheerun/vim-polyglot'  " syntax highlighting for many languages.
Plug 'jeetsukumaran/vim-indentwise'
Plug 'prettier/vim-prettier'
Plug 'flazz/vim-colorschemes'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'

" vim-surround
Plug 'tpope/vim-surround'

" nerdtree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" devicons
Plug 'ryanoasis/vim-devicons'

" for e.g. go/ciderlsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" autocomplete
Plug 'ycm-core/YouCompleteMe' "https://totucuong.github.io/2020/05/10/YouCompleteMe.html
let g:ycm_show_diagnostics_ui = 1
" you need tern installed for JS

" linting
Plug 'dense-analysis/ale'
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'javascriptreact': ['prettier', 'eslint'],
\  'typescript': ['prettier','eslint'],
\  'typescriptreact': ['prettier', 'eslint'],
\  'python': ['black']
\}
let g:ale_linters = {
\  'javascript': ['prettier', 'eslint'],
\  'javascriptreact': ['prettier', 'eslint'],
\  'typescript': ['prettier','eslint'],
\  'typescriptreact': ['prettier', 'eslint'],
\  'python': ['black']
\}
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1

autocmd ColorScheme * highlight ALEError ctermbg=DarkRed
autocmd ColorScheme * highlight ALEWarning ctermbg=DarkYellow
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

"Enable ALE
let g:ale_linters_explicit = 1  " Use explicit linters
let g:ale_fix_on_save = 1       " Fix code on save if linters support it

" Enable ALE linting when files are opened and edited
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_save = 1
" let g:ale_fix_on_save = 1

" Display error messages in the sign column and underline errors
" let g:ale_echo_cursor = 1  " Show error under cursor

" let g:ale_floating_preview = 1
" let g:ale_hover_to_floating_preview = 1
" let g:ale_hover_cursor = 1
nnoremap <silent> <leader>aj :ALENext<CR>
nnoremap <silent> <leader>ak :ALEPrevious<CR>

" colorscheme fruidle
"set bg=dark

" For autoreading buffers changed on disk.
" On tmux versions > 1.9, you'll need to add in .tmux.conf:
" set -g focus-events on
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()
filetype plugin indent on    " required


" show the number of matches in the lower right when you search
set shortmess-=S

" unsuccessful attempt to change the color of comments in monokai
hi Comment ctermfg=31 guifg=#0087af

" colorscheme tempus_day
" set bg=light

"Plug 'maksimr/vim-jsbeautify' commented 2018-02-20 because it was slowing vim startup
" Plug 'vim-scripts/Conque-GDB' disabled 2018-02-20 because this took 1s on vim startup

" Disabled on 18 June 2019 because I don't use these or they weren't functional.
" Plug 'gcmt/breeze.vim'
"
" Plug 'kien/ctrlp.vim'
" CtrlP
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
"
" Plug 'SirVer/ultisnips'
" Ultisnip
" NOTE: <f1> otherwise it overrides <tab> forever
" let g:UltiSnipsExpandTrigger="<f1>"
" let g:UltiSnipsJumpForwardTrigger="<f1>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:did_UltiSnips_vim_after = 1

" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/lh-brackets'
" Plug 'Raimondi/delimitMate'

" Translate the character under the cursor to a decimal value:
nmap <M-a>d i<C-R>=char2nr(getline(line("."))[col(".") - 1])<CR><ESC>lx
" ... hexadecimal value:
nmap <M-a>h ix<C-R>=ConvertToBase(char2nr(getline(line("."))[col(".") - 1]),16)<CR><ESC>lx
" ... octal value:
nmap <M-a>o i<C-R>=ConvertToBase(char2nr(getline(line("."))[col(".") - 1]),8)<CR><ESC>lx

" Merge the current and next line of //-commented text
nmap <c-j> Jdf/dl

if has('autocmd')
  filetype plugin indent on
endif
" if has('syntax') && !exists('g:syntax_on')
"  syntax enable
" endif
syntax enable

" Use :help 'option' to see the documentation for the given option.
set backspace=indent,eol,start
"set complete-=i
set showmode
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set laststatus=2
set ruler
set showcmd
set wildmenu
set autoread
set autowrite
set encoding=UTF-8
set listchars=tab:▒░,trail:▓
set list
set mouse=a " enable mouse scrolling
set number
set hidden " do not history when leavy buffer
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
"set completeopt=menuone,longest,preview
set scrolloff=7
set ignorecase " when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)
set shiftwidth=2 " 1 tab == 2 spaces
set tabstop=2
set autoindent
set smartindent
set viminfo^=% " Remember info about open buffers on close
set relativenumber
set cursorline
set tabstop=2
set regexpengine=2 " different regex engine, 0 and 1 dont work on Apple silicon

" No annoying sound on errors
set noerrorbells
set novisualbell
" set t_vb=
" set tm=500

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

inoremap <C-U> <C-G>u<C-U>

" Don't use Ex mode, use Q for formatting
map Q gq

" comment / uncomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}

" go to the next and previous buffer. analagous to gt for next tab.
noremap gb :bn<CR>
noremap gB :bp<CR>

" save and quit
nnoremap <C-q> :wq<CR>

" faster up and down
nnoremap J 5j<CR>
nnoremap K 5k<CR>

" getting  J and K back to defaults with leader
nnoremap <Leader>j J<CR>
nnoremap <Leader>k K<CR>

" better window handling
nnoremap <C-h> <C-w>h<CR>
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>

" better tab handling
nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprev<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>td :tabdo<CR>
nnoremap <Leader>tc :tabclose<CR>

" pretter
nnoremap <Leader>p :Prettier<CR>

" find/replace current symbol with \s
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" this is an attempt to make find and replace easier. it doesn't work yet.
:nnoremap <Leader>r :%s//\=@0/g

let mapleader = ','
noremap  <Leader>g :GitGutterToggle<CR>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Reload buffers when files change on disk
" https://unix.stackexchange.com/a/383044
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

hi Search cterm=NONE ctermfg=Black ctermbg=LightBlue



