syn on
autocmd Filetype c,cpp set sw=4 
"| set expandtab
"set expandtab

"set t_Co=256
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
endif

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fenc=cp936
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8


set ic
set hidden
set sw=4
set nocompatible
set backspace=indent,eol,start
set autoindent
set smartindent
set ai! 
set nu! 
set showmatch
set incsearch
filetype plugin indent on
set scrolloff=5
set ts=4
set history=300
let mapleader = "," 

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
nmap <leader>q :q<cr>
nmap <leader>hl <Plug>MarkSet
nmap <leader>hh <Plug>MarkClear
nmap <leader>hr <Plug>MarkRegex
nmap <leader>fn :nohls<cr>
nmap <leader>t :set tags=tags<cr>

nmap <leader>sm :marks<cr>
nmap <leader>sb :buffers<cr>
nmap <leader>a :b#<cr>
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>

"Find/replace issue
set hlsearch
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
nmap j gj
nmap k gk
nmap <f11> :bp<cr>
nmap <f12> :bn<cr>
nmap <f10> :ls<cr>

"let loaded_nerd_comments=1
let NERDMenuMode=0
let NERDShutUp=1
color desert

set statusline=[%f]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2
highlight StatusLine cterm=bold ctermfg=darkgreen ctermbg=black
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

"Windows Ctrl+C/Ctrl+V
"vmap <C-c> "+y
"vmap <C-v> "+p
"nmap <C-v> "+p

map <C-l> :Tlist <cr> 

set cursorline
hi CursorLine  cterm=NONE   ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white

set t_Co=256
let g:rehash256 = 1
"colorscheme koehler 
"
"colorscheme solarized 
colorscheme molokai 
:set cc=80


if has('gui_running')
        set background=light
else
        set background=dark
endif

" ctags 
filetype plugin indent on
":set autochdir

set tags+=/home/qspace/QQMail/wework/tags

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_SelectFirstItem = 2 " 选中第一项 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

"nerdcommenter
let g:mapleader = ","


"doxygentoolki
let g:DoxygenToolkit_authorName="abelzhu, abelzhu@tencent.com"
let s:licenseTag = "\<enter>Copyright(C) All right reserved"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1


au BufNewFile,BufRead *.cpp set syntax=c
"set foldmethod=indent
"set fdm=indent
"set foldlevel=9999
"

""当新建 .h .c .hpp .cpp .sh .php等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.proto,*.sh,*.py,*.php exec ":call SetTitle()" 

""加入注释
func SetComment()
        if &filetype == 'sh' || expand("%:e") == 'sh' 
                call setline(1,  "##") 
                call setline(2,  " # Copyright (C) ".strftime("%Y")." All rights reserved.")
                call setline(3,  " #   ") 
                call setline(4,  " # @File ".expand("%:t")) 
                call setline(5,  " # @Brief ") 
                call setline(6,  " # @Author abelzhu, abelzhu@tencent.com")
                call setline(7,  " # @Version 1.0") 
                call setline(8,  " # @Date ".strftime("%Y-%m-%d")) 
                call setline(9,  " #")
                call setline(10, " #") 
                call setline(11, " ") 
    elseif &filetype == 'py' || expand("%:e") == 'py' 
                call setline(1, "#!/usr/bin/env python") 
                call setline(2, "# -*- coding:utf-8 -*-") 
                call setline(3,  "##") 
                call setline(4,  " # Copyright (C) ".strftime("%Y")." All rights reserved.")
                call setline(5,  " #   ") 
                call setline(6,  " # @File ".expand("%:t")) 
                call setline(7,  " # @Brief ") 
                call setline(8,  " # @Author abelzhu, abelzhu@tencent.com")
                call setline(9,  " # @Version 1.0") 
                call setline(10,  " # @Date ".strftime("%Y-%m-%d")) 
                call setline(11,  " #")
                call setline(12, " #") 
                call setline(13, " ") 
    elseif &filetype == 'php' || expand("%:e") == 'php' 
                call setline(1,  "<?php /*") 
                call setline(2,  " * Copyright (C) ".strftime("%Y")." All rights reserved.")
                call setline(3,  " *   ") 
                call setline(4,  " * @File ".expand("%:t")) 
                call setline(5,  " * @Brief ") 
                call setline(6,  " * @Author abelzhu, abelzhu@tencent.com")
                call setline(7,  " * @Version 1.0") 
                call setline(8,  " * @Date ".strftime("%Y-%m-%d")) 
                call setline(9,  " *")
                call setline(10, " */") 
                call setline(11, " ") 
        else 
                call setline(1,  "/*") 
                call setline(2,  " * Copyright (C) ".strftime("%Y")." All rights reserved.")
                call setline(3,  " *   ") 
                call setline(4,  " * @File ".expand("%:t")) 
                call setline(5,  " * @Brief ") 
                call setline(6,  " * @Author abelzhu, abelzhu@tencent.com")
                call setline(7,  " * @Version 1.0") 
                call setline(8,  " * @Date ".strftime("%Y-%m-%d")) 
                call setline(9,  " *")
                call setline(10, " */") 
                call setline(11, "") 
        endif
endfunc

""定义函数SetTitle，自动插入文件头
func SetTitle()
        call SetComment()

        if expand("%:e") == 'h' || expand("%:e") == 'hpp' 
                call setline(12, "#pragma once") 
                call setline(13, " ") 
                call setline(14, " ") 
                call setline(15, " ") 
                call setline(16, " ") 
                call setline(17, "namespace wework {") 
                call setline(18, " ") 
                call setline(19, "}  // namespace") 
                exec ":18" 
        elseif &filetype == 'c' || expand("%:e") == 'cpp' 
                ""elseif &filetype == 'cpp' 
                call setline(12, "#ifndef __STDC_FORMAT_MACROS") 
                call setline(13, "#define __STDC_FORMAT_MACROS") 
                call setline(14, "#endif") 
                call setline(15, "#include <inttypes.h>") 
                call setline(16, " ") 
                call setline(17, "#include \"iLog.h\"") 
                call setline(18, "#include \"wework/wwcomm/wwutils/wwfastlog.h\"") 
                call setline(19, " ") 
                call setline(20, "#include \"".expand("%:t:r").".h\"") 
                call setline(21, " ") 
                call setline(22, "using namespace Comm;") 
                call setline(23, " ") 
                call setline(24, " ") 
                call setline(25, "namespace wework {") 
                call setline(26, " ") 
                call setline(27, "}  // namespace") 
                exec ":26" 
        elseif &filetype == 'sh' || expand("%:e") == 'sh' 
                call setline(12, "#!/bin/bash") 
                call setline(13, " ") 
                exec ":13" 
        endif
endfunc

""当新建 BUILD 时，自动添加模版
autocmd BufNewFile BUILD exec ":call AddBuild()" 
function AddBuild()
        call setline(1 , "from mm_envs import *")
        call setline(2 , " ")
        call setline(3 , "# ---------------------- REPLACE_ME----------------------")
        call setline(4 , "cc_library(")
        call setline(5 , "      name='REPLACE_ME',")
        call setline(6 , "      srcs=[")
        call setline(7 , "              'REPLACE_ME.cpp',")
        call setline(8 , "      ],")
        call setline(9 , "      deps = [")
        call setline(10, "              '//mm3rd/protobuf-2.3.0:protobuf',")
        call setline(11, "      ],")
        call setline(12, "      defs = [")
        call setline(13, "              'LINUX',")
        call setline(14, "              '_PTHREADS',")
        call setline(15, "              'TIXML_USE_STL',")
        call setline(16, "              '_NEW_LIC',")
        call setline(17, "              '_GNU_SOURCE',")
        call setline(18, "              '_REENTRANT',")
        call setline(19, " ")
        call setline(20, "      ],")
        call setline(21, " ")
        call setline(22, " ")
        call setline(23, "      extra_cppflags = [")
        call setline(24, "              '-Wall',")
        call setline(25, "              '-pipe',")
        call setline(26, "              '-fPIC',")
        call setline(27, "              '-Wno-deprecated', ")
        call setline(28, "              '-std=c++11',")
        call setline(29, "      ],")
        call setline(30, " ")
        call setline(31, "      export_incs = ['.',],")
        call setline(32, ")")

endfunc

:set path+=/usr/local/include/
:set path+=~/QQMail/
:set path+=~/QQMail/comm2/core/
:set path+=~/QQMail/comm2/svrkit/

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1"Plugin 'scrooloose/syntastic'

" ----------------tab替换为4空格(google style 建议)-------------
set ts=4"  (注：ts是tabstop的缩写，设TAB宽4个空格)
set expandtab

" ----------------------syntastic-------
let g:syntastic_check_on_open = 1


"" ---------------- vundle ----------------
set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
 
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
Bundle 'file:///~/.vim/plugin/'
" ...
 
filetype plugin indent on     " required!
"
" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
""----------------------- 按键映射 ---------------------------
""map <space> <C-d>
""map dw daw
""map :Vs :vs
imap ,, <ESC>la
"智能补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
""map <C-j> 5j
"" 下面的map, 如果出现诡异的反应，肯定是因为后面多了空格。。
map <space> 5j
""map <C-k> 5k
map ; 5k
map <C-h> 5h
map <C-l> 5l
:set pastetoggle=<F11> "切换粘贴模式

"按F5运行python" 
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR> 
function RunPython() 
    let mp = &makeprg 
    let ef = &errorformat 
    let exeFile = expand("%:t") 
    setlocal makeprg=python\ -u 
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
    silent make % 
    copen 
    let &makeprg = mp 
    let &errorformat = ef 
endfunction
