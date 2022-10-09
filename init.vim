:set number
:set relativenumber

:set tabstop=4
:set shiftwidth=4
:set smarttab
:set expandtab
:set smartindent

:set guioptions=off " Откдючение строки прокрутки в GUI
:set showtabline=0 "Отключаем панель табов (окошки FT
:set encoding=UTF-8

:set nobackup
:set nowritebackup

:set cursorline " Подсвечивание строки с курсором

:set updatetime=300
:set signcolumn=yes

call plug#begin('~/.vim/plugins') 


" Functional
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/tagbar'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


" Theme and Style
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'ap/vim-css-color'

" autocomplete
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-surround'

call plug#end() 

"								 Theme and Style settings

"colorscheme sublimemonokai 
colorscheme gruvbox

"16 вы можете поменять на нужный вам размер шрифта
set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16 "Это light версия

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" 								Map for Functional
let mapleader = ","

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <F8>  :TagbarToggle<CR>
nnoremap ,ff <cmd>Telescope find_files<cr>
nnoremap ,fg <cmd>Telescope live_grep<cr>

nnoremap <silent>    <Tab> <Cmd>BufferNext<CR>
nnoremap <silent>    <C-q> <Cmd>BufferClose!<CR>

"                               Настройка комбинация автодополнения
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"----------------------------------------------------------------------------------

" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF
