"-------------------------vim个性化配置相关begin-------------------------------------------------------------------------
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set number         "显示行号
set ignorecase     "区分大小写
"下面这个选项，当查找的字符串里面有大小写时，会区分大小写，如果全是小写，则不区分大小写
"set ignorecase smartcase

set hlsearch       "搜索高亮

set ts=4   "tab为4个空格
"缩进
set autoindent 
set cindent
set shiftwidth=4
set softtabstop=4
"解决退格键删除失效的问题
set backspace=indent,eol,start
"tab自动补规则配置
set wildmode=longest,list,full
"自动语法高亮
syntax enable
syntax on
"终端开启256色,vim-airline,vim配色插件等都需要256色支持
set t_Co=256
"-------------------------vim个性化配置相关end-------------------------------------------------------------------------

"************************bundle插件管理进行插件下载管理begin******************************************************************
"vundle使用说明:https://github.com/VundleVim/Vundle.vim/blob/master/README_ZH_CN.md
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

"插件安装***************************************
"Plugin 'taglist.vim'          "taglist不用了，用tagbar
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'omnicppcomplete'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'sainnhe/archived-colors.git'
Plugin 'dyng/ctrlsf.vim'
"插件安装***************************************

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
"************************bundle插件管理进行插件下载管理end******************************************************************


"---------------------插件相关的个性化配置begin-------------------------------------------------------------------

"NERDTree设置
map <leader>d :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p> "刷新nerdtree快捷键
"打开vim自动打开nerdtree
"autocmd VimEnter * NERDTreeToggle
"设置NERDTree窗口在左
let NERDTreeWinPos=0
"多颜色显示
let NERDChristmasTree=1
""窗口尺寸
let NERDTreeWinSize=40

"tagbar
let g:tagbar_ctags_bin = 'ctags' "tagbar数据来源为ctags
"let g:tagbar_left = 1           "让tagbar在页面左侧显示，默认右边
let g:tagbar_width = 45          "设置tagbar的宽度大小，默认40
let g:tagbar_autofocus = 1       "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
"let g:tagbar_sort = 0           "设置标签不排序，默认排序
map <leader>t :TagbarToggle<CR>

" omnicppcomplete
set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2 " search namespaces in the current buffer and in included files
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" ctrl-p插件配置
let g:ctrlp_map = '<c-p>'     "设置打开ctrlP快捷建
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20' "ctrlP窗口大小
let g:NERDTreeChDirMode = 2 
let g:ctrlp_working_path_mode = 'wa' "以当前工作目录作为搜索起点

"solarized配色插件
"set background=dark
"let g:solarized_termcolors=256     "solarized使用256色 不适用256色会与vim-airline冲突
"colorscheme solarized
"cryslominsa配色插件
colorscheme cryslominsa

"cpp-enhanced-highlight插件，关键字高亮配置
"高亮类，成员函数,声明
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"高亮标准库库
let g:cpp_concepts_highlight = 1
"模板函数高亮:
let g:cpp_experimental_simple_template_highlight = 1
"文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
"let g:cpp_experimental_template_highlight = 1

"vim-airline插件配置
"需要先安装powerline fonts字体支持，否则vim-airline有些图形显示不了
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
set laststatus=2 "1为关闭底部状态栏 2为开启"
set ttimeoutlen=50
set ambiwidth=double "防止特殊符号无法正常显示"
let g:airline#extensions#tabline#enabled=1 "顶部tab显示"
let g:airline#extensions#tabline#buffer_nr_show=1 "显示buffer编号

"buffer切换
nmap <tab> :bn<cr> "设置tab键切换下一个buffer
"normal 模式下使用 bp 切换到上一个 Buffer
nnoremap <silent> bp :bprevious<CR>
"normal 模式下使用 bd 关闭当前 Buffer
nnoremap <silent> bd :bdelete<CR>
" normal 模式下使用 bl 列出 Buffer 列表
nnoremap <silent> bl :ls<CR>
" normal 模式下使用 bo 打开一个新 Buffer
nnoremap <silent> bo :enew<CR>
"ctrlsf插件配置
"需要先安装ag
"let g:ctrlsf_ackprg = 'ag'   //设置ctrlsf使用ag
nmap <Leader>s :CtrlSF<space>
"---------------------插件相关的个性化配置end-------------------------------------------------------------------




"************************其他的一些配置::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"ctags相关配置
set tags+=tags;    "如果找不到tags，则到上层目录继续找
set tags+=~/.vim/tags/cpp_src/tags " 设置stl等第三方库的tags搜索路径
set tags+=~/.vim/tags/common_src/tags " 设置stl等第三方库的tags搜索路径

"cscope设置
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=1                       "先查找tags文件，再查找cscope文件
  set cst                          "按tag命令时会同时查找cscope文件和tags文件
  set nocsverb
   "add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb

  set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-  "在quickfix窗口中显示cscope的查询结果

  nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

"插入模式快捷键
set pastetoggle=<F9>

"编译快捷键
map <F5> <ESC>:call DoMake("notsingle")<CR>
"只编译当前文件
map <F4> <ESC>:call DoMake("single")<CR>
function DoMake(bSingle)
    exec "wall"
	"call SetCompilation(a:bSingle)
	exec "make!"
	"exec "cf ../engine/.e1.log"   "加载log
    exec "cw 20" 
endfunction
    
function SetCompilation(bSingle)
    set efm=%f\ line\ %l%m                "设置错误信息格式
	if a:bSingle == "single"
        set makeprg=sh\ ../engine/qmake.sh\ % "设置make命令
	else
        set makeprg=sh\ ../engine/qmake.sh
	endif
endfunction


"quickfix快捷键
map <F3> <ESC>:copen 25<CR>
map <F2> <ESC>:ccl<CR>
"下一项
map <leader>n :cn<CR>
"前一项
map <leader>p :cp<CR>

"quickfix中的grep设置
"快捷键:leader f选中鼠标当前关键字进行搜索
nmap <leader>f :grep <C-R>=expand("<cword>")<CR><CR>
set grepformat=%f:%l%m
set grepprg=grep\ -rsn\ --exclude=*.b\ --exclude=*.out\ --exclude=tags\ --exclude=*.swp\ --exclude=*.log

"vim折叠快捷键设置
map<F6> <ESC>:set fdm=marker<CR>
map<F7> <ESC>:set fdm=indent<CR>

//feature add 1
//feature add 2