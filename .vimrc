""" plugin section
call plug#begin('~/.vim/plugged')
Plug 'wikitopian/hardmode'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'
"" general syntax plugins
Plug 'pedrohdz/vim-yaml-folds'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'preservim/tagbar'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'haya14busa/incsearch.vim'
Plug 'arcticicestudio/nord-vim'

"" language specific plugins
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'andviro/flake8-vim'
"Plug 'plasticboy/vim-markdown'
Plug 'modille/groovy.vim'
"Plug 'vim-scripts/groovy.vim'
Plug 'elixir-editors/vim-elixir'

"" writing plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
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
inoremap jj <Esc>											"exit insert mode

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
if v:version > 810
	set signcolumn=yes										"extra column for info
endif
if &term =~ '^xterm'
	" 1 or 0 -> blinking block, 2 -> solid block, 3 -> blinking underscore, 4 -> solid underscore, 5 -> blinking vertical bar, 6 -> solid vertical bar
	let &t_SI .= "\<Esc>[5 q"
	let &t_EI .= "\<Esc>[1 q"
endif

""" chars/formatting
set nowrap 														"disable wrapping lines
set tabstop=2													"tab as 2 spaces
set shiftwidth=2											"tab as 2 spaces (on >)
set listchars=tab:▶·,trail:·					"set tabs and trails chars
set list															"set visible special chars
filetype plugin on
filetype plugin indent off

""" autoclosing omni
set omnifunc=syntaxcomplete#Complete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
au BufNewFile,BufRead *.groovy setf java



"""" Plugin settings ---------------------
""" Gruvbox ccolor scheme
" colorscheme desert 										"hack for dark gruvbox
" colorscheme gruvbox
colorscheme nord

""" Lightline
let g:lightline = {
      \ 'mode_map': { 'n' : 'N', 'i' : 'I', 'R' : 'R', 'v' : 'V', 'V' : 'VL', "\<C-v>": 'VB', 'c' : 'C', 's' : 'S', 'S' : 'SL', "\<C-s>": 'SB', 't': 'T', },
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'], [ 'filename', 'modified' ] ],
      \   'right': [ [ 'percent' ], [ 'lineinfo' ], [ 'readonly', 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_infos', 'linter_ok'], ['filetype', 'gitbranch'] ],
      \ },
      \ 'tabline': { 'left': [ ['buffers'] ] },
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
      \   'linter_ok': 'LightlineLinterOK',
      \   'gitbranch': 'gitbranch#name'
      \ }
      \ }
let g:lightline#bufferline#number_separator=':'
let g:lightline#bufferline#show_number=1
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
augroup ProjectDrawer
	autocmd!
	autocmd VimEnter * if argc() == 0 | Explore! | endif
augroup END

""" Tagbar
nmap <F8> :TagbarToggle<CR>

""" IncSearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" https://github.com/niklasl/vimheap/blob/master/after/syntax/groovy.vim
" syn region foldBraces start=/{\s*$/ end=/}\s*$/ transparent fold keepend extend
" syn region foldImports start=/\(^\s*\n^import\)\@<= .\+$/ end=+^\s*$+ transparent fold keepend
" set foldmethod=syntax
let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
\ }

""" Linelight + Goyo
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
