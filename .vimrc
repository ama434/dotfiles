syntax enable

" 行番号を表示
set number
" タイトルを表示
set title
"buffer切り替えのときに保存しなくても良くなる
set hidden
"windmenu
set wildmenu

set background=dark

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" 

" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'icebergDark'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" モードごとに表示される文字を変更する

let g:airline_mode_map = {
	\ 'n'	: 'NORMAL',
	\ 'i'	: 'INSERT',
	\ 'R'	: 'REPLACE',
	\ 'c'	: 'COMMAND',
	\ 'v'	: 'VISUAL',
	\ 'V'	: 'V-Line',
	\ '⌃V'	: 'V-Block',
	\ }

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/battery.vim'
Plug 'ulwlu/elly.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'edkolev/tmuxline.vim'
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
"Plug 'vim-denops/denops.vim
call plug#end()

" タブ切り替えのショートカットを利用可能にする
nmap <C-p> <plug>AirlineSelectPrevTab
nmap <C-n> <plug>AirlinrSelectNextTab

let g:tmuxline_preset = {
	\'a'	: '#S',
 	\'c'	: ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
	\'win'	: ['#I', '#W'],
 	\'cwin'	: ['#I', '#W', '#F'],
 	\'x'	: '#(date)',
 	\'y'	: ['%R', '%a', '%Y'],
	\'z'	: '#H'}
let g:tmuxline_theme = 'icebergDark'

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}

colorscheme iceberg


