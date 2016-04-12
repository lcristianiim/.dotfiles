"  _________             ___.
"  /   _____/____________ \_ |__   ____
"  \_____  \\___   /\__  \ | __ \ /  _ \
"  /        \/    /  / __ \| \_\ (  <_> )
" /_______  /_____ \(____  /___  /\____/
"         \/      \/     \/    \/
" _________        .__          __  .__
" \_   ___ \_______|__| _______/  |_|__|____    ____
" /    \  \/\_  __ \  |/  ___/\   __\  \__  \  /    \
" \     \____|  | \/  |\___ \  |  | |  |/ __ \|   |  \
"  \______  /|__|  |__/____  > |__| |__(____  /___|  /
"         \/               \/               \/     \/

execute pathogen#infect()
syntax on
filetype plugin indent on

"Numbering rows with grey
highlight LineNr ctermfg=grey

" Setting the 256 colors in vim
syntax enable
" colorscheme molokai
"
if &term =~ '256color'
      " disable Background Color Erase (BCE) so that color schemes
      " render properly when inside 256-color tmux and GNU screen.
      " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
set t_ut=
endif

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
" Setting the <leader key>
let mapleader=","
" I don't want any delay in my IDE
set timeoutlen=1000 ttimeoutlen=0
" Heighlight the current line
" set cursorline
" When a new split is made the cursor will pass to the new split automatically
 set splitbelow
 set splitright
" Not to change directory automatically
set noautochdir
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" Trailing whitespaces
match ErrorMsg '\s\+$'

" Delete trailings with leather + rtw
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Allow command-t to search in the pwd directory
let g:CommandTTraverseSCM = 'pwd'

set encoding=utf-8
runtime bundles/tplugin_vim/macros/tplugin.vim
" html syntax for ejs
au BufNewFile,BufRead *.ejs set filetype=html

"SPECIAL THANKS TO IONICĂ BIZĂU FOR THE FOLLOWING CONFIGURATION:

" ------------------------------"
" Plugins
" ------------------------------"

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleLazy 'The-NERD-tree', {'augroup' : 'NERDTree'}
command! NERDTree :call NERDTree()
function! NERDTree()
NeoBundleSource The-NERD-tree
    NERDTree
endfunction

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif
" Command-t plugin
NeoBundle 'wincent/command-t'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle "mattn/emmet-vim.git"
NeoBundle "Shougo/neocomplcache.vim"

let g:neocomplcache_enable_at_startup = 1

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'lrvick/Conque-Shell'
NeoBundle 'heavenshell/vim-jsdoc'

let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_return_description = 1

NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"
NeoBundle "honza/vim-snippets"
NeoBundle "sheerun/vim-polyglot"
NeoBundle 'junegunn/vim-emoji'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'
NeoBundle 'tpope/vim-unimpaired'

call neobundle#end()
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" ------------------------------"
" Misc Settings
" ------------------------------"

" Necesary for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

" Line Numbers PWN!
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Highlight things that we find with the search
set hlsearch

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4

" ------------------------------"
" Look and Feel
" ------------------------------"

" Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
syntax on
filetype plugin indent on
set nowrap
set incsearch

" Paste
let paste_mode = 0 " 0 = normal, 1 = paste
func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc

" Open Terminal in new tab
func! OpenTerminal()
   tabnew
   ConqueTerm bash
   return
endfunc

" Todo List Mode
function! TodoListMode()
   e ~/.todo.otl
   Calendar
   wincmd l
   set foldlevel=1
   tabnew ~/.notes.txt
   tabfirst
endfunction

" ------------------------------"
" Mappings
" ------------------------------"

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Paste Mode!  Dang! <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
nnoremap <silent> <F12> :call OpenTerminal()<CR>
set pastetoggle=<F10>

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Delete unwanted spaces
autocmd BufWritePre * :%s/\s\+$//e
