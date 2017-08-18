set nocompatible
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'alvan/vim-closetag'
Plugin 'mxw/vim-jsx'
Plugin 'OrangeT/vim-csharp'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'prettier/vim-prettier'

call vundle#end()            " required for Vundle
filetype plugin indent on    " required for Vundle

syntax enable
syntax on
set encoding=utf-8
colorscheme molokai
let g:molokai_original = 1

imap jk <ESC>
let mapleader=" "
let g:ackprg = 'ag --vimgrep'
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden = 1
let g:NERDSpaceDelims = 1
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Resize panes when vim is resized
au VimResized * exe "normal! \<c-w>="

set mouse=a                                                                       " Enable mouse
set path+=**/src/main/**,**                                                       " Press gf within quotes in require('') to open that file
set suffixesadd+=.js
set noswapfile
set nobackup                                                                      " Disable backups
set ttyfast                                                                       " Set faster rendering
set list listchars=tab:\·\ ,trail:·                                               " Mark whitespace with character
set laststatus=2                                                                  " Always display statusline
set fillchars+=stl:\ ,stlnc:\
set statusline+=%F                                                                " Add path to statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set clipboard=unnamed
set t_ut=                                                                         " Disable deleted colouring
set t_Co=256                                                                      " Force 256 colour mode
set t_vb=                                                                         " Turn off bell
au FileType gitcommit set tw=72                                                   " Wrapping long commit messages
set nowrap                                                                        " No wrapping for lines longer than window
set shiftwidth=2                                                                  " Smarttab values
set shiftround                                                                    " Round indent to multiple of shiftwidth
set smarttab                                                                      " <tab> depends on value of shiftwidth
set tabstop=2                                                                     " Number of spaces <tab> will count for
set softtabstop=2 " Number of spaces <tab> counts while editing
set expandtab                                                                     " Use <space>s rather than <tab>
set autoindent                                                                    " Use current line indentation when copying
set scrolloff=3                                                                   " Minimum lines before/after curso
set linebreak                                                                     " Don't split on words
set hidden                                                                        " Dont complain about buffers
set number                                                                        " Show line number
set ruler " Show ruler
set splitbelow                                                                    " Set vertical splits to below
set splitright                                                                    " Set horizontal splits to the right
set backspace=indent,eol,start                                                    " Backspace was not working anymore
set cursorline                                                                    " Highlight line
set autoread                                                                      " Reload files if they have changed
set ttyfast                                                                       " Set faster rendering
set gdefault                                                                      " Perform global substitutions by default
set autowrite
set autowriteall
set infercase                                                                     " Smarter completions"
set wildignore+=node_modules/*,public/css/*,public/lib/**/*,public/js/*,coverage/**
set showmatch                                                                     " Show matching brace briefly
set hlsearch                                                                      " Highlight all matches
set incsearch                                                                     " Show pattern while typing
set ignorecase                                                                    " Ignore the case of normal letters
set smartcase                                                                     " Override ignorecase when searching with uppercase patterns
set runtimepath^=~/.vim/bundle/ctrlp.vim
set fileformat=unix
set wildmenu                                                                      " Autosuggest on tab"
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
nnoremap <C-t> :NERDTreeToggle<CR>
vnoremap . :norm.<CR>

" iTerm config
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap <C-c> "*y
