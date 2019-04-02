set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set number         "显示行号
set ignorecase     "区分大小写
"set ignorecase smartcase
""这个选项，当查找的字符串里面有大小写时，会区分大小写，如果全是小写，则不区分大小写

set hlsearch       "搜索高亮

set ts=4   "tab为4个空格
"缩进
set autoindent 
set cindent
set shiftwidth=4
set softtabstop=4

"解决退格键删除失效的问题
set backspace=indent,eol,start

set tags+=tags;    "如果找不到tags，则到上层目录继续找
set tags+=~/.vim/tags/cpp_src/tags " 设置stl等第三方库的tags搜索路径
set wildmode=longest,list " Ex命令自动补全采用bash方式"
syntax on
filetype plugin indent on

"NERDTree设置
"快捷方式打开NERDTree :ctrl-n
map <C-x> :NERDTree<CR>
"设置NERDTree窗口在左边
let NERDTreeWinPos=0
"多颜色显示
let NERDChristmasTree=1
""窗口尺寸
let NERDTreeWinSize=35

"执行pathongen下的插件
execute pathogen#infect()

" taglist
let Tlist_Show_One_File=1        "只展示一个文件的taglist
let Tlist_Exit_OnlyWindow=1      "当taglist是最后一个窗口时自动退出
let Tlist_Use_Right_Window=1     "在右边展示taglist窗口
let Tlist_Sort_Type="name"       "tag按名字排序
let Tlist_WinWidth=40            "窗口大小
map <C-a> :TlistToggle<CR>

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

"按F9进入插入模式
set pastetoggle=<F9>

if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1                       "先查找tags文件，再查找cscope文件
  set cst                          "按tag命令时会同时查找cscope文件和tags文件
  set nocsverb
  " add any database in current directory
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


"编译全部
map <F5> <ESC>:call DoMake("notsingle")<CR>
"只编译当前文件
map <F4> <ESC>:call DoMake("single")<CR>
function DoMake(bSingle)
    exec "wall"
	call SetCompilation(a:bSingle)
	exec "make!"
	exec "cf ../engine/.e1.log"
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

"下个错误
map <C-n> :cn<CR>

"打开和关闭quickfix窗口
map <F3> <ESC>:copen 25<CR>
map <F2> <ESC>:ccl<CR>

"grep
set grepformat=%f:%l%m
set grepprg=grep\ -rsn\ --exclude=*.b\ --exclude=*.out\ --exclude=tags\ --exclude=*.swp\ --exclude=*.log
