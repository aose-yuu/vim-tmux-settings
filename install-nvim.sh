#!/bin/bash

cat <<EOF > init.vim
" polyglot SETTINGS
let g:polyglot_disabled = ['markdown']

call jetpack#begin('~/.config/nvim/jetpackged')

" 見た目プラグイン
Jetpack 'cocopon/iceberg.vim'
Jetpack 'Yggdroot/indentLine'
Jetpack 'itchyny/lightline.vim'
Jetpack 'sheerun/vim-polyglot'
Jetpack 'joshdick/onedark.vim'

" エディタ関連プラグイン
Jetpack 'tpope/vim-surround'
Jetpack 'tpope/vim-commentary'
Jetpack 'brglng/vim-im-select'
Jetpack 'mattn/vim-lexiv'
Jetpack 'turbio/bracey.vim'
Jetpack 'lambdalisue/fern.vim'

" 補完・LSP関連プラグイン
Jetpack 'Shougo/ddc.vim'
Jetpack 'vim-denops/denops.vim'
Jetpack 'Shougo/pum.vim'
Jetpack 'Shougo/ddc-around'
Jetpack 'LumaKernel/ddc-file'
Jetpack 'Shougo/ddc-matcher_head'
Jetpack 'Shougo/ddc-sorter_rank'
Jetpack 'Shougo/ddc-converter_remove_overlap'
Jetpack 'shun/ddc-vim-lsp'
Jetpack 'prabirshrestha/vim-lsp'
Jetpack 'mattn/vim-lsp-settings'

" 各言語別プラグイン
Jetpack 'dart-lang/dart-vim-jetpackin'
Jetpack 'hankchiutw/flutter-reload.vim'
Jetpack 'digitaltoad/vim-pug'
Jetpack 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug']   }
Jetpack 'evanleck/vim-svelte'

call jetpack#end()

" 各プラグイン設定===================================================
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
    \'around',
    \'vim-lsp',
    \'file',
    \])
call ddc#custom#patch_global('sourceOptions', {
    \'_': {
    \'matchers': ['matcher_head'],
    \'sorters': ['sorter_rank'],
    \'converters': ['converter_remove_overlap'],
    \},
    \'around': {'mark': 'Around'},
    \'vim-lsp': {
    \'mark': 'LSP',
    \'matchers': ['matcher_head'],
    \'forceCompletionPattern': '\.|:|->|"\w+/*'
    \},
    \'file': {
    \'mark': 'file',
    \'isColatile': v:true,
    \'forceCompletionPattern': '\S/\S*'
    \}})
call ddc#enable()
set completeopt-=preview
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-i>   <Cmd>call pum#map#cancel()<CR>

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

mv init.vim ~/.config/nvim
