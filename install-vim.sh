#!/bin/bash

cat <<EOF > .vimrc
" polyglot SETTINGS
let g:polyglot_disabled = ['markdown']

call jetpack#begin('~/.vim/jetpackged')

" 見た目プラグイン
" Jetpack 'cocopon/iceberg.vim'
Jetpack 'joshdick/onedark.vim'
Jetpack 'Yggdroot/indentLine'
Jetpack 'itchyny/lightline.vim'
Jetpack 'sheerun/vim-polyglot'

" エディタ関連プラグイン
Jetpack 'tpope/vim-surround'
Jetpack 'tpope/vim-commentary'
" Jetpack 'mattn/vim-lexiv'
Jetpack 'lambdalisue/fern.vim'
Jetpack 'mhinz/vim-startify'

" 補完・LSP関連プラグイン
Jetpack 'neoclide/coc.nvim'
Jetpack 'yaegassy/coc-volar-tools', {'do': 'yarn install --frozen-lockfile'}

" 各言語別プラグイン
Jetpack 'mattn/emmet-vim'

call jetpack#end()

" 各プラグイン設定===================================================

" coc.nvim SETTINGS
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
set completeopt=menuone,noselect
set statusline^=%{coc#status()}

" emmet-vim SETTINGS
let g:user_emmet_leader_key='<C-W>'
let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" lightline SETTINGS
let g:lightline = { 'colorscheme': 'wombat'   }

" Fern SETTINGS
nnoremap <silent><C-n> :Fern . -reveal=%<CR>
let g:fern#default_hidden=1

" indentLine SETTINGS
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 245
let g:indentLine_color_gui = '#708090'

" dart-vim-jetpackin SETTINGS
let g:dart_format_on_save = 1

" colorscheme onedark SETTINGS"
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" 基本設定===========================================================
set termguicolors
colorscheme onedark
let g:im_select_default = 'com.apple.inputmethod.Kotoeri.Roman'
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE

if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
 endif

highlight EndOfBuffer ctermbg=NONE guibg=NONE
set encoding=UTF-8
set number
set helplang=ja
set backspace=2
set lines=60
set nobackup
set noshowmode
set noswapfile
set noundofile
set autoread
xnoremap p "_dP
set hidden
set showcmd
set wildmode=list:longest
hi Constant ctermfg=14
set cursorline
hi clear CursorLine
set visualbell
set showmatch
set laststatus=2
set clipboard&
set clipboard^=unnamedplus
set mouse=a
set tabstop=2
set shiftwidth=0
set expandtab
autocmd FileType python setlocal tabstop=4
set incsearch
set wrapscan
set timeoutlen=150
syntax enable


" 操作設定===========================================================
" Leader
let mapleader = "\<Space>"

" ESC
inoremap <silent> jj <ESC>
" Save
nnoremap <Leader>w :w<CR>
" End
nnoremap <Leader>q :q<CR>
" PageDown
nnoremap <Leader>j <PageDown>
" PageUp
nnoremap <Leader>k <PageUp>
" Left
nnoremap <nowait><Leader>h ^
" Right
nnoremap <nowait><Leader>l $
" Move Window
noremap <Leader><Leader> <C-w>w

" Split Window
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
EOF

mv .vimrc ~/.vimrc
