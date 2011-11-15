"-----------------------------------------------------------------------------
" General Stuff
"-----------------------------------------------------------------------------

" no compatibility mode
set nocp

" turn off highlight search to start
set nohls

" search while we type
set incsearch

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Turn off the angryness
set noerrorbells
set visualbell

" Don't update the display while executing macros
set lazyredraw

" Fix esc key delaying itself wtf?
set ttimeoutlen=0

"-----------------------------------------------------------------------------
" Editor Formatting
"-----------------------------------------------------------------------------

" turn off paren matching
let loaded_matchparen = 1

" When the page starts to scroll, keep the cursor 5 lines from the top/bottom
set scrolloff=5

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Tabs and spaces (ruby)
au FileType ruby setl sw=2 sts=2 et

" Indentation
set autoindent
set smartindent

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Let the cursor do some crazy stuff
set virtualedit=all

" Auto-completetion
set completeopt=menuone,longest,preview

"-----------------------------------------------------------------------------
" Key mappings
"-----------------------------------------------------------------------------

" No more shift colon!
nmap <space> :

" jj esc!
imap jj <esc>

" Toggle that stupid highlight search
nmap <silent> ,m :set invhls<CR>:set hls?<CR>

" Shortcut to rapidly toggle `set list`
nmap <silent> ,l :set list!<CR>

" NERDTree toggling
nmap <silent> ,nt :NERDTreeToggle \| :silent NERDTreeMirror<CR>

" Tab switching (mainly for terminal)
nmap <silent> ,f :tabn<CR>
nmap <silent> ,d :tabp<CR>

" Keep text selected after indentation. Favorite setting of all time :D
vnoremap < <gv 
vnoremap > >gv  

" Edit/Source my .vimrc
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"-----------------------------------------------------------------------------
" Plugin stuff
"-----------------------------------------------------------------------------

" SuperTab auto-highlight first result
let g:SuperTabLongestHighlight = 1

"-----------------------------------------------------------------------------
" File stuff
"-----------------------------------------------------------------------------

" Set filetype stuff to on
filetype plugin indent on

" Setting up the directories
set backup 						" backups are nice ...
set backupdir=$HOME/.vimbackup/ " but not when they clog .
set viewdir=$HOME/.vimviews/ 	" same for view files
set directory=$HOME/.vimswap/ 	" same for swap files

" Creating directories if they don't exist
silent execute '!mkdir -p $HOME/.vimbackup'
silent execute '!mkdir -p $HOME/.vimswap'
silent execute '!mkdir -p $HOME/.vimviews'

"-----------------------------------------------------------------------------
" Colors and layout
"-----------------------------------------------------------------------------

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

syntax enable

set number
set background=dark
set ruler
set cursorline

colorscheme xoria256
"colorscheme jellybeans
"colorscheme peaksea

" Stuff (only if GUI running)
if has("gui_running")

	" Remove the stupid toolbar
	set guioptions-=T

	" Remove stupid scrollbars
	set guioptions-=L
	set guioptions-=r

	" Use the same symbols as TextMate for tabstops and EOLs
	set listchars=tab:▸\ ,eol:¬
    
    set guifont:Monaco:h12

endif