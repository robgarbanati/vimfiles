set nocp                " set nocompatible
set laststatus=2        " grey status bar at the bottom
syntax enable           " syntax highlighting
set ai                  " auto indenting
set nu                  " line numbers
set ic                  " case insensitive search
set scs                 " smart case search
set hlsearch 		    " highlight what you search for
set incsearch 		    " type-ahead-find
set expandtab		    " use spaces instead of tabs
set smarttab		    " be smart when using tabs
set shiftwidth=4	    " 1 tab == 2 spaces
set tabstop=4		    " 1 tab == 2 spaces
set ru                  " shows ruler for cursor
set sc                  " showcmd shows incomplete commands
set foldmethod=syntax   " set a foldmethod
set foldnestmax=1
set splitright          " all vertical splits open to the right
"set colorcolumn=120

"remove all scroll bars
set guioptions-=r
set guioptions-=L

" slash-slash to search for visual selection, h/t http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnorem // y/<c-r>"<cr>

" activates indenting for files
filetype plugin indent on

" easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" No arrow keys allowed
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" But I like navigating in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Code Navigation
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'

" autocompletion / snippets
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
"Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " snippet library

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Vim enhancements
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'

" Appearance
Plug 'altercation/vim-colors-solarized'

" Man page navigation
"Plug 'bruno-/vim-man'

" Language specific
Plug 'burnettk/vim-angular'
Plug 'evidens/vim-twig'
Plug 'klen/python-mode'
Plug 'fisadev/vim-isort'
Plug 'fatih/vim-go'
Plug 'saltstack/salt-vim'


call plug#end()

" Testing
set completeopt=longest,menuone,preview

" NERDTree
:command NT NERDTreeToggle
:command NTF NERDTreeFind
let NERDTreeIgnore = ['\.pyc$']

" gitgutter
highlight clear SignColumn

" Ctrl-P
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
let g:ctrlp_custom_ignore = '\.pyc'
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" pymode
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_lint_checkers = ['flake8', 'mccabe']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<S-Enter>"
"let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Create Blank Newlines and stay in Normal mode
nnoremap <C-j> o<Esc>
nnoremap <C-k> O<Esc>

" Ctrl-Space will toggle folds!
nnoremap <C-Space> za

"reinstall c-c c-v
vmap <C-c> "ay
nmap <C-v> "ap
imap <C-v> <Esc>"ap
nmap <C-c> "ayiw

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>   	"+gP
map <S-Insert>  	"+gP

cmap <C-V>  	<C-R>+
cmap <S-Insert> 	<C-R>+

" Remap ;w to escape in insert mode.
inoremap ;; ;<Esc>:w<Enter>
inoremap ;w <Esc>:w<Enter>

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Clear the highlighting
nnoremap <Esc> <Esc>:noh<Enter>

" Favorite Color Scheme
if has("gui_running")
    let g:solarized_termtrans = 1
    set background=dark
    colorscheme solarized
    "colorscheme jellybeans
    " Remove Toolbar
    set guioptions-=T
    "Consolas is wussup
    set guifont=Consolas\ 9
else
    set t_Co=256
    colorscheme jellybean
endif

" Fix the search and replace highlighting issue. Gotta wait until BufReadPost
" because it takes a while for the colorscheme to load, it seems
autocmd BufReadPost * hi IncSearch guifg=red


"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Mappings

let mapleader = " "

" Nerdcommenting
nnoremap <Leader><Leader> :call NERDComment(0,"toggle")<Enter>
vnoremap <Leader><Leader> :call NERDComment(0,"toggle")<Enter>
nnoremap <Leader>r :call NERDComment(0,"uncomment")<Enter>
vnoremap <Leader>r :call NERDComment(0,"uncomment")<Enter>
nnoremap <Leader>s :call NERDComment(0,"sexy")<Enter>
vnoremap <Leader>s :call NERDComment(0,"sexy")<Enter>
nnoremap <Leader>i :call NERDComment(0,"toggle")<Enter>
vnoremap <Leader>i :call NERDComment(0,"toggle")<Enter>

" remember things yanked in a special register, so we can delete at will
" without concerns
nnoremap <Leader>p "0p
nnoremap <Leader>P "0P

" often I want to find the next _
onoremap W f_
nnoremap W f_l
onoremap E t_
nnoremap E lt_
onoremap B T_
nnoremap B hT_

" In my mind, p means parentheses
onoremap p i(

" Usually, when making the header file, I want to just copy the original file,
" and append a ; to the end of each declaration and delete the body of the
" (folded) function. This automatically does just that.
nmap <Leader>h A;<Esc>jddj

" Make Y like D and every other cap command
nnoremap Y y$

" Open the TagList Plugin <F3>
nnoremap <silent> <F3> :Tlist<CR>

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" ctags
nnoremap <C-\> :vsp <Enter>:exec("tag ".expand("<cword>"))<Enter>zz

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Make it so there are always several lines visible above and below the cursor
set scrolloff=10

"Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0

" Properly display man pages
" ==========================
runtime ftplugin/man.vim
if has("gui_running")
	nnoremap K :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>
endif

filetype plugin indent on
syntax on

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

:set tags=./tags,./../tags,./../../tags,./../../../tags,tags
