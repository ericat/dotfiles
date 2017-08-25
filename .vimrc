set nocompatible
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'alvan/vim-closetag'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

call vundle#end()            " required for Vundle
filetype plugin indent on    " required for Vundle

syntax enable
syntax on
set encoding=utf-8
colorscheme molokai
let g:molokai_original = 1

imap jk <ESC>
let mapleader=" "
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Resize panes when vim is resized
au VimResized * exe "normal! \<c-w>="

set mouse=a                                                                       " enable mouse
set path+=**/src/main/**,**                                                       " press gf within quotes in require('') to open that file
set suffixesadd+=.js
set noswapfile
set nobackup                                                                      " disable backups
set ttyfast                                                                       " set faster rendering
set list listchars=tab:\·\ ,trail:·                                               " mark whitespace with character
set laststatus=2                                                                  " always display statusline
set fillchars+=stl:\ ,stlnc:\
set statusline+=%F                                                                " add path to statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set clipboard=unnamed
set t_ut=                                                                         " disable deleted colouring
set t_Co=256                                                                      " force 256 colour mode
set t_vb=                                                                         " turn off bell
au FileType gitcommit set tw=72                                                   " wrapping long commit messages
set nowrap                                                                        " no wrapping for lines longer than window
set shiftwidth=2                                                                  " smarttab values
set shiftround                                                                    " round indent to multiple of shiftwidth
set smarttab                                                                      " <tab> depends on value of shiftwidth
set tabstop=2                                                                     " number of spaces <tab> will count for
set softtabstop=2 " number of spaces <tab> counts while editing
set expandtab                                                                     " use <space>s rather than <tab>
set autoindent                                                                    " use current line indentation when copying
set scrolloff=3                                                                   " minimum lines before/after curso
set linebreak                                                                     " don't split on words
set hidden                                                                        " dont complain about buffers
set number                                                                        " show line number
set ruler " show ruler
set splitbelow                                                                    " set vertical splits to below
set splitright                                                                    " set horizontal splits to the right
set backspace=indent,eol,start                                                    " backspace was not working anymore
set cursorline                                                                    " highlight line
set autoread                                                                      " reload files if they have changed
set ttyfast                                                                       " set faster rendering
set gdefault                                                                      " perform global substitutions by default
set autowrite
set autowriteall
set infercase                                                                     " smarter completions"
set wildignore+=node_modules/*,public/css/*,public/lib/**/*,public/js/*,coverage/**
set showmatch                                                                     " show matching brace briefly
set hlsearch                                                                      " highlight all matches
set incsearch                                                                     " show pattern while typing
set ignorecase                                                                    " ignore the case of normal letters
set smartcase                                                                     " override ignorecase when searching with uppercase patterns
set runtimepath^=~/.vim/bundle/ctrlp.vim
set fileformat=unix
set wildmenu                                                                      " autosuggest on tab"
set wildmode=full

autocmd BufWritePre *.js :%s/\s\+$//e "Remove trailing whitespace on save
autocmd BufNewFile,BufRead *.pcss set syntax=css

" Comfort commands
command! -bar -bang Q quit<bang>
command! W w
command! WQ wq
command! Wq wq
command! Q q

" Insert blank line above/below
nmap T O<ESC>j
nmap t o<ESC>k

" Ctrlp config
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|public$|log\|tmp\|target$\|coverage\|node_modules$',
    \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.log$|\.tar.gz$|.zip$|.swp$|\.lock$'
    \ }
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" Silver searcher config
let g:ackprg = 'ag --vimgrep'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Clear last search highlighting
map <Space> :noh<cr>

" Highlight the current line
hi CursorLine cterm=NONE ctermbg=241

" Theme and style settings
augroup CursorLine " CursorLine function highlights line in active pane
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" NERDTree config
let g:NERDTreeHijackNetrw=0 " Prohibit NERDTree from spawning new panes
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden = 1
let g:NERDSpaceDelims = 1
nnoremap <C-t> :NERDTreeToggle<CR>
vnoremap . :norm.<CR>

" iTerm config
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap <C-c> "*y

