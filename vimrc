" 语法高亮
syntax on

"颜色主题,位于/usr/share/vim/vim73/colors，可选择: blue  delek  evening   murphy torte darkblue desert koehler pablo ron zellner default  elflord   morning  peachpuff   shine
:colorscheme elflord

" 设置当文件被改动时自动载入
" set autoread
" quickfix模式
"autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
" 代码补全 
" set completeopt=preview,menu 
" 允许插件  
filetype plugin on
" 共享剪贴板  
set clipboard+=unnamed 
" 从不备份  
"set nobackup
" "make 运行
" :set makeprg=g++\ -Wall\ \ %
" "自动保存
set autowrite
set ruler                   " 打开状态栏标尺
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
" 开始折叠
set foldenable
set fdm=manual
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" 为C程序提供自动缩进
set smartindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=10
"禁止生成临时文件
"set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里还是1
set cmdheight=1
" 侦测文件类型
filetype on
" 载入文件类型插件
 filetype plugin on
" 为特定文件类型载入相关缩进文件
 filetype indent on
" 保存全局变量
 set viminfo+=!
" 带有如下符号的单词不要被换行分割
" set iskeyword+=_,$,@,%,#,-
 " 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setfiletype txt


ab #i #include

"自动添加注释和代码
"c框架frame
"ab fc  #include <stdio.h><Enter><Enter>int main(int argc, char* argv[])<Enter>{<Enter><Enter>return 0;<Enter>}<up><up><up>

"c++框架frame
"ab fcpp  #include <iostream><Enter>using namespace std;<Enter><Enter>int main(int argc, char* argv[])<Enter>{<Enter><Enter>return 0;<Enter>}<up><up><up>

"map <F9> O/***************************************************<CR>Copyright(c) 2013-2014 <CR>Time:    <Esc>:read !date <CR>kJ$a<CR>Author:  yyq<CR>Version: 1.0<CR>***************************************************/<CR><Esc>

"按F5编译
map <F5> :call Compile()<CR>
func Compile() 
    exec "w"
    exec ":!clear"
    if expand("%:e")=="cc"||expand("%:e")=="cpp"
    	exec ":! g++ -o%:r %"
    elseif expand("%:e")=="c"
	exec ":! gcc -o%:r %"
    endif
    exec ":!./%:r"
endfunc


"定义函数SetTitle，自动插入文件头 
autocmd BufNewFile *.cpp,*.c,*.cc,*.sh exec ":call SetHead()" 
func SetHead()
    call setline(1, "")
    call setline(2, "/********************************************************")
    call setline(3, " Copyright(c) 2013-1014.")
    call setline(4, " Time:			".strftime("%c"))
    call setline(5, " Author:		YYQ")
    call setline(6, " Description:	1.0")
    call setline(7, "*******************************************************/")
	call setline(8, "")
    if expand("%:e")=="cc"||expand("%:e")=="cpp"
	call setline(9, "")
	call setline(10, "#include<iostream>")
	call setline(11, "using namespace std;")
	call setline(12, "int main(int argc,char* argv[])")
	call setline(13, "{")
	call setline(14, "	return 0;")
	call setline(15, "}")
	endif
    if expand("%:e")=="c"
	call setline(9, "")
	call setline(10, "#include<stdio.h>")
	call setline(11, "int main(int argc,char* argv[])")
	call setline(12, "{")
	call setline(13, "	return 0;")
	call setline(14, "}")
 	endif
 endfunc
 
