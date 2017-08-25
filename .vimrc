" Beginners .vimrc
" v0.1 2012-10-22 Philip Thrasher
" v0.2 2017-06-30 Daniel Sochor
"
" Important things for beginners:
" * Start out small... Don't jam your vimrc full of things you're not ready to
"   immediately use.
" * Read other people's vimrc's.
" * Use a plugin manager for christ's sake! (I highly recommend vundle)
" * Spend time configuring your editor... It's important. Its the tool you
"   spend 8 hours a day crafting your reputation.
" * remap stupid things to new keys that make you more efficient.
" * Don't listen to the haters that complain about using non-default
"   key-bindings. Their argument is weak. I spend most of my time in the editor
"   on my computer, not others, so I don't care if customizing vim means I'll
"   have a harder time using remote vim.
"
" Below I've left some suggestions of good default settings to have in a bare
" minimal vimrc. You only what you want to use, and nothing more. I've heavily
" commented each, and these are what I consider bare necessities, my workflow
" absolutely depends on these things.
"
" If you have any questions, email me at pthrash@me.com

" Setup Vundle:
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
set nocompatible " Fuck VI... That's for grandpas.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" Let vundle manage itself:
Plugin 'VundleVim/Vundle.vim'

" Syntax checking
" To Compile,
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py (--clang-completer)"
Plugin 'Valloric/YouCompleteMe'

" Airline!
Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

" File tree
Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'

" No indent when pasting
Plugin 'ConradIrwin/vim-bracketed-paste'

" Just color schemes.
Plugin 'chriskempson/base16-vim'

" Fuzzy finder -- absolutely must have.
Plugin 'kien/ctrlp.vim'

" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'

" DelimitMate
Plugin 'Raimondi/delimitMate'

" In addtion to the above plugins, you'll likely need some for individual
" non-standard syntaxes that aren't pre-bundled with vim. Here are some I use,
" these are required for me, but depending on what code you write, obviously
" this may differ for you.

" vim indents HTML very poorly on it's own. This fixes a lot of that.
Plugin 'indenthtml.vim'

" I write markdown a lot. This is a good syntax.
Plugin 'tpope/vim-markdown'

" LessCSS -- I use this every day.
Plugin 'groenewege/vim-less'

call vundle#end()

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set number " Add line numbers.

" We have VCS -- we don't need this stuff.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" Vim automatically changes directories to the current one.
set autochdir

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jk <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" Let ctrlp show hidden files, duh.
let g:ctrlp_show_hidden = 1

" Make backspace work like in most other programs:
set backspace=indent,eol,start
let delimitMate_expand_cr=1
au FileType java let b:delimitMate_matchpairs = "(:),[:],{:}"

" Map NE to NerdTree
noremap <c-n> :NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1

" YCM Configuration
hi YcmErrorSection cterm=NONE
set completeopt-=preview

" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
set term=screen-256color
let base16colorspace=256
colorscheme base16-eighties
set background=dark

" Some Airline settings
let g:airline_theme='base16'
set laststatus=2

" Force vim to always have 5 lines below cursor
set scrolloff=5
