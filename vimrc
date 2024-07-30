inoremap jk <Esc>
inoremap JK <Esc>
vnoremap jk <Esc>

set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed  " On Vim compiled with +clipboard
nnoremap qq :q!<CR>
set number

"hjkl is directional arrows h left j up k down l right"
"w moves one word forward and b goes one word back"
"V is visual mode"
"e goes to the end of the word"
"b is to go back"
"y is to copy/yank"
"p is to paste"

"u is command to undo"
"ctrl r is to redo"

"d to delete then combine with how long eg dw would go to start of next word"
"dd delets whole line"

"A enters input end of line"
"I enters input start of line"
"O enters input above
"o enters input below"

"} to go down a paragrpah"
"{ to go up a paragraph"

"split<FILE NAME> does horizontal split for file name"
"vsplit<FILE NAME> does veritcal split"
"ctrl w then w cycles through the panels"
"/ lets u search word in file"

"G goes bottom of file"
"gg goes top of file"

"0 goes to start of line"
"$ goes to end of line"
"ZZ saves and exits file"

"sp splits horizontal
"vsp splits vertically
"ctrl z hides file temporarily"
"fg [num] returns to minimised file at index num"

"These mappings allow you to move lines up and down using Alt (A) + j (for down) and Alt (A) + k (for up) in Normal, Insert, and Visual modes
nnoremap ∆ :m .+1<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
nnoremap ˚ :m .-2<CR>==
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/NERDTree'
Plug 'hashivim/vim-terraform'
Plug 'KarimElghamry/vim-auto-comment'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
set background=dark

let g:lsp_diagnostics_enabled = 0
let g:lsp_document_highlight_enabled = 0
let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_enable = 0
let g:lsp_diagnostics_signs_enabled = 0
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"NerdTree stuff
"Open a File in a New Tab: Navigate to the file you want to open and press t on the file.
"Go to the Next Tab: Press gt or :tabnext.
"Go to the Previous Tab: Press gT or :tabprev.
"Go to a Specific Tab: Press Ngt, where N is the tab number you want to navigate to (e.g., 2gt to go to the second tab).
"Close the Current Tab: Simply type :tabclose or :tabc and press Enter.
"Close a Specific Tab: Type :tabclose followed by the tab number, e.g., :tabclose 3 to close the third tab.
"lose All Tabs Except the Current One: You can use :tabonly or its abbreviation :tabo to close all other tabs except for the current one you're working on.

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"For autocomplete
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()
":help coc-config for more details
":CocInstall coc-json is how u install JSON extension for coc. i.e. search up
"for what to install for coc

" Makes cursor small when in insert mode
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

let &t_SI="\033[4 q" " start insert mode
let &t_EI="\033[1 q" " end insert mode

syntax on
filetype plugin indent on

"shift 8 to highlight word and see wherever its used in file and n to go to it
"and shift n to go back
set hlsearch

set backupdir=~/.vim/backup
set directory=~/.vim/swp
nnoremap d "_d
vnoremap d "_d

"ctrl } to go to function
"ctrl t to go back
"ctrl \ to open def in new tab
set tags=./tags,tags;$HOME

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"knowing name of file
"ctrl g

let g:airline_theme='solarized'
let g:airline_extensions = ['branch', 'whitespace']


let g:airline_section_x = ''
let g:airline_section_y = ''
vnoremap <silent><C-c> :AutoInlineComment<CR>
nnoremap <silent><C-c> :AutoInlineComment<CR>
inoremap <silent><C-c> :AutoInlineComment<CR>

" Stops autocommenting next line
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
