syntax on
color zellner
set nu
set wrap
set cursorline
set wildmenu
set clipboard=unnamed
set ttimeoutlen=100
" 设置鼠标滚轮
set mouse=a


call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

" 使用退格键
set nocompatible
set backspace=2


map R :source $MYVIMRC<CR>
map Q :q<CR>
map W :w<CR>

" ijkl代替上下左右
noremap i k
noremap k j
noremap j h

" J 移到行首
noremap J 0
" L 移到行末
noremap L $
noremap I 7k
noremap K 7j



" 光标前插入u
noremap u i
" 光标后插入o
noremap o a
" 光标下行插入O
noremap O o
" 光标上行插入U
noremap U O

" 撤销改为p
noremap p u
" 粘贴改为h
noremap h p




inoremap <C-j> <Left>
inoremap <C-k> <Down>
inoremap <C-i> <Up>
inoremap <C-l> <Right>

inoremap ,d <++>

" 分式
autocmd Filetype markdown inoremap ,f \frac{<++>}{<++>}
autocmd Filetype markdown inoremap ,g \sqrt[]{2}
autocmd Filetype markdown inoremap ,. <Esc>0/<++><CR>c4l
autocmd Filetype markdown inoremap ,d <++>
autocmd Filetype markdown inoremap \'' <br><Enter>   
autocmd Filetype markdown inoremap \; <br><Enter>
autocmd Filetype markdown inoremap ,k $$<++>\begin{cases}<++>\end{cases}$$
autocmd Filetype markdown inoremap <Shift><Enter> <br><Enter>
autocmd Filetype markdown inoremap ,l [<++>]<<++>> <Esc>F[li
autocmd Filetype markdown inoremap  ,x **<Esc>F*li
autocmd Filetype markdown inoremap ,m **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,n ### 
autocmd Filetype markdown inoremap ,b ## 
autocmd Filetype markdown inoremap ,y ---<Enter>layout: post<Enter>title: "<++>"<Enter>tags:  <Enter>---<Esc>2kF"i 
autocmd Filetype markdown inoremap ,/ ```<Enter><Enter>```<Esc>ki
autocmd Filetype markdown inoremap /, <sup></sup><++><Esc>9hi
autocmd Filetype markdown inoremap /. <sub></sub><++><Esc>9hi
autocmd Filetype markdown inoremap ,t <image src="http://hurc.gitee.io/pic/_pic/<++>" style="zoom: <++>%; /">
autocmd Filetype markdown inoremap <Tab> &emsp;
autocmd Filetype markdown noremap \m :MarkdownPreview<Enter>
autocmd Filetype markdown noremap \M :StopMarkdownPreview<Enter>

" markdown表格工具
let g:table_mode_corner = '|'
let g:table_mode_border=0
let g:table_mode_fillchar=' '

" MarkdownPreview有bug
" let g:mkdp_path_to_chrome = "/bin/firefox"
" let g:markdown_preview_sync_firefox_path = "/bin/firefox"
let g:mkdp_browser = 'chromium'

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


