" 非兼容vi 模式
set nocompatible
set autoread
set shortmess=atI	"去掉启动显示

"backspace工作模式
set backspace=indent,eol,start

"实时搜索搜索配置
set incsearch

"高亮显示搜索结果
set hlsearch

"搜索时大小写不敏感
set ignorecase

"保留40个历史命令
set history=40

"显示行号
set number

"显示当前行号列号
set ruler

"高亮当前行和列
set cursorline
set cursorcolumn

"总是显示状态栏
set laststatus=2

"显示状态栏正在输入的命令
set showcmd

"开启语法高亮
syntax enable
syntax on

"设置系统字体及大小
set guifont=Monaco:h16

"设置主题
colorscheme molokai
set background=dark

"设置新文件编码为UTF-8
set fileencoding=utf8

" 自适应不同语言的智能缩进
filetype indent on
" " 将制表符扩展为空格
set expandtab
" " 设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
" " 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 备份


"快捷键类配置
"NerdTree配置
map <F2> :NERDTreeToggle<CR>

"AutoPep8 加自动运行Python
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
"快捷键结束


"vim-indent-guides配置
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" " 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" " 色块宽度
let g:indent_guides_guide_size=1
" " 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"Ycmcompleter配置
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
"直接触发自动补全
let g:ycm_key_invoke_completion = ''

"Vim-Airline配置
let g:airline_theme="luna"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

"Vundle配置
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'

" 你的所有插件需要在下面这行之前填入
call vundle#end()
filetype plugin indent on "必须 加载vim自带和插件相应的语法和文件类型相关脚本"

