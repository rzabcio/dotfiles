""" plugins
call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

""" basic settings
colorscheme nord
set number														"current line number
set relativenumber										"relative numbers

""" formatting
set nowrap 														"disable wrapping lines
set tabstop=2													"tab as 2 spaces
set shiftwidth=2											"tab as 2 spaces (on >)
set listchars=tab:▶·,trail:·					"set tabs and trails chars
set list															"set visible special chars

""" working dirs
set dir=~/.local/share/nvim/swapfiles
set directory=~/.local/share/nvim/swapfiles
set backupdir=~/.local/share/nvim/swapfiles

""" encodings
set encoding=utf-8
set fileencoding=utf-8
set langmenu=en_US.UTF-8
language messages en_US.UTF-8

"" key mappings
"" source $VIMRUNTIME/mswin.vim	"windows keys
nnoremap <C-k> :m-2<CR>								"move line up
nnoremap <C-j> :m+<CR>								"move line down
nnoremap <C-h> :bp<CR>								"prev buffer
nnoremap <C-l> :bn<CR>								"next buffer
inoremap jj <Esc>											"exit insert mode
