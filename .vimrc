syntax on
filetype on
filetype plugin indent on

set nocompatible              " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'yaoguais/phpctags.vim'
Plugin 'docunext/closetag.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set colorcolumn=85
set cursorline
set linebreak
set backspace=eol,start,indent
set laststatus=2
set encoding=utf-8
set noswapfile
set fileencodings=utf-8,gb18030
highlight Normal guibg=#000001
" 改背景后选中区域无法高亮，也得调一下
highlight Visual guibg=#323232
" 灰色的状态栏很扎眼，调一下
highlight StatusLine guibg=#444444 guifg=#b3deef
" vim 的 terminal 状态栏需要单独配置
highlight StatusLineTerm guibg=#444444 guifg=#b3deef
highlight StatusLineTermNC guibg=#444444 guifg=#999999
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let NERDTreeIgnore=['\.pyc','\~$','\.swp', 'vendor', '\.git$']
let g:NERDTreeShowIgnoredStatus = 1
set tabstop=4
filetype indent on
set ci       " 开启cindent
set noet     " 关闭expandtab
set sw=4     " shiftwidth=4
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf
