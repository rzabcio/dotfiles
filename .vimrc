""" plugin section
call plug#begin('~/.vim/plugged')
Plug 'wikitopian/hardmode'
Plug 'airblade/vim-gitgutter'
"Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
"" lang plugins
Plug 'preservim/tagbar'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'andviro/flake8-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Plug 'modille/groovy.vim'
Plug 'vim-scripts/groovy.vim'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
call plug#end()

""" working dirs
set dir=~/.vim/swapfiles
set directory=~/.vim/swapfiles
set backupdir=~/.vim/swapfiles

""" encodings
set encoding=utf-8
set fileencoding=utf-8
set langmenu=en_US.UTF-8
language messages en_US.UTF-8

""" Windows settings
if has("win64") || has("win32") || has("win16")
	if stridx(&shell, 'posh')==-1
		set lines=45 columns=220	"window size
		set guioptions-=m					"disable menu bar
		set guioptions-=T					"disable toolbar
		set guioptions-=r					"disable scrollbar
		set guioptions-=l					"disable scrollbar
		set foldlevel=10
		""set guifont=Consolas:h9:cANSI
		set guifont=Cascadia\ Code:h9:cANSI
		"set guifont=CaskaydiaCove\ Nerd\ Font:h9:cANSI
	endif
	""copy/cut/paste (Visual -> Ctrl+Q)
	source $VIMRUNTIME/mswin.vim
	""working dirs
	set dir=C:/Users/jglazik/.vim/swapfiles
	set directory=C:/Users/jglazik/.vim/swapfiles
	set backupdir=C:/Users/jglazik/.vim/swapfiles
	behave mswin
endif

"" key mappings
"" source $VIMRUNTIME/mswin.vim	"windows keys
nnoremap <C-k> :m-2<CR>								"move line up
nnoremap <C-j> :m+<CR>								"move line down
nnoremap <C-h> :bp<CR>								"prev buffer
nnoremap <C-l> :bn<CR>								"next buffer
imap jj <Esc>													"exit insert mode

""" basic settings
set exrc															"load local .vimrc if present
set nocompatible											"disable Vi-compatibility
set noerrorbells											"disable error sounds/notification
syntax enable													"syntax detection and coloring
set backspace=2												"???
set path+=**													"tab-completion for all file-related tasks
set complete-=i												"complete does not work well with above, so remove 'includes'
set wildmenu													"display all matching files when tab-complete
set number														"current line number
set relativenumber										"relative numbers
set splitright												"new vertical split on the right
set cursorline												"highlightin current line
set scrolloff=8												"scroll screen before gettin to the end of file
set signcolumn=yes										"extra column for info

""" chars/formatting
set nowrap 														"disable wrapping lines
set tabstop=2													"tab as 2 spaces
set shiftwidth=2											"tab as 2 spaces (on >)
set listchars=tab:▶·,trail:·					"set tabs and trails chars
set list															"set visible special chars
filetype plugin on
filetype indent off

""" autoclosing omni
set omnifunc=syntaxcomplete#Complete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
au BufNewFile,BufRead *.groovy setf java



"""" Plugin settings ---------------------
""" Gruvbox ccolor scheme
colorscheme desert 										"hack for dark gruvbox
colorscheme gruvbox

""" Lightline
let g:lightline = {
      \ 'mode_map': { 'n' : 'N', 'i' : 'I', 'R' : 'R', 'v' : 'V', 'V' : 'VL', "\<C-v>": 'VB', 'c' : 'C', 's' : 'S', 'S' : 'SL', "\<C-s>": 'SB', 't': 'T', },
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'percent' ], [ 'lineinfo' ], [ 'readonly', 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_infos', 'linter_ok'] ],
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'readonly': 'error',
      \   'linter_checking': 'right',
      \   'linter_infos': 'right',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'right',
      \ },
      \ 'component_function': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ }
let g:lightline#bufferline#number_separator=':'
let g:lightline#bufferline#show_number=2
set laststatus=2
set showtabline=2

""" Fuzzy Finder
let g:fzf_layout = { 'down': '~40%' }

""" Smoothscroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 7, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 7, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

""" Hard Mode
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Don''t use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

""" Flake8
let g:PyFlakeOnWrite = 1
"let g:PyFlakeCheckers = 'flake8'
let g:PyFlakeDisabledMessages = 'E501,C901'

""" Netrw
let g:netrw_banner = 0								"disable annoying banner
"let g:netrw_browse_split = 4					"open file on the previous window
"let g:netrw_altv = 1									"open itself on the left
let g:netrw_liststyle = 3							"tree view
"let g:netrw_list_hide = netrw_gitignore#Hide()

""" Tagbar
nmap <F8> :TagbarToggle<CR>
