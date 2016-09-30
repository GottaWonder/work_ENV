""""""""""""""""""""""""""""""
"基本设置
""""""""""""""""""""""""""""""
"显示行号
set number
"显示光标的坐标
set ruler
color elflord
"设置Tab键的宽度
set shiftwidth=4
set tabstop=4
"设置行间距
set linespace=8
"禁用自动缩进
set noautoindent
""""""""""""""""""""""""""""""
"设置字体Consolas
"set guifont=Consolas:h11
set guifont=SourceCodePro-Regular:h11  
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
""""""""""""""""""""""""""""""
"根据编辑模式更改输入法光标颜色，同时禁用IME自动切换
if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Orange gui=NONE
    hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
    set iminsert=0 imsearch=0
endif
"与Windows共享剪贴板
set clipboard+=unnamed
"编辑vimrc之后，重新加载
"autocmd! bufwritepost _vimrc source $VIM/_vimrc
"即时搜索并高亮
set incsearch
set hlsearch
""""""""""""""""""""""""""""""
"设置编码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
""""""""""""""""""""""""""""""
"设置不备份
set nobackup
set nowritebackup
set noswapfile
""""""""""""""""""""""""""""""
" 设定doc文档目录
"let helptags=$VIMFILES.'/doc'
""""""""""""""""""""""""""""""
"对比文档
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ "\<cmd"
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set mapleader
let mapleader = ","
nmap mm :%s/\r//g<cr>
"Fast reloading of the .vimrc
"map <silent> <leader>ss :source D:\Program Files(x86)\Vim\_vimrc<cr>
"Fast editing of .vimrc
"map <silent> <leader>ee :e D:\Program Files (x86)\Vim\_vimrc
"When .vimrc is edited, reload it
"autocmd! bufwritepost .vimrc source ~/.vimrc 
"""""""""""""""""""""""""Plugin Manager""""""""""""""Vundle
set nocompatible " be iMproved, required
filetype off  " required
" set the runtime path to include Vundle and initialize
"Vundle的路径
set rtp+=$VIM/vimfiles/bundle/vundle.vim 
" alternatively, pass a path where Vundle should install plugins
"插件的安装路径
"call vundle#begin('~/some/path/here')
call vundle#rc('$VIM/vimfiles/bundle')  
Bundle 'gmarik/vundle'
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""tags
"set tags =/
"自动向上级找tag
set tags=tags;
set autochdir
" 按下F8重新生成tag文件，并更新taglist
"map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""taglist
Bundle 'taglist.vim'
let Tlist_Auto_Open = 1	"启动vim后，自动打开/关闭taglist窗口__Auto__Open__
let Tlist_Show_Menu = 0	"在gvim中，自动显示/隐藏taglist菜单
let Tlist_Show_One_File = 1	"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1	"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_SingleClick = 0	"单/双击tag跳转
let Tlist_Use_Right_Window = 0	"在左/右侧窗口中显示taglist窗口(默认是左侧)
"let Tlist_Show_Menu=1	"显示taglist菜单
"let Tlist_GainFocus_On_ToggleOpen = 1	"TlistToggle打开taglist,输入焦点在taglist窗口中
"Tlist_WinHeight和Tlist_WinWidth可以设置taglist窗口的高度和宽度。
"Tlist_Use_Horiz_Window为１设置taglist窗口横向显示；
"Tlist映射
nmap ,tl :TlistToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""BufExplorer
let g:bufExplorerDefaultHelp=0    " Do not show default help
""""""""""""""""""""""""""""""""""""""""""""""""vim-airline
"状态栏增强插件,包括了buffer显示条扩展smart tab line以及集成了一些插件"
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
let g:airline_theme="luna" 
"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 设置consolas字体"
"set guifont=Consolas\ for\ Powerline\ FixedD:h11

"设置状态栏符号显示，下面编码用双引号"
 " let g:Powerline_symbols="fancy"
 " let g:airline_symbols = {}
 " let g:airline_left_sep = "\u2b80" 
 " let g:airline_left_alt_sep = "\u2b81"
 " let g:airline_right_sep = "\u2b82"
 " let g:airline_right_alt_sep = "\u2b83"
 " let g:airline_symbols.branch = "\u2b60"
 " let g:airline_symbols.readonly = "\u2b64"
 " let g:airline_symbols.linenr = "\u2b61"
  "设置切换Buffer快捷键"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>
 "设置顶部tabline栏符号显示"
 "let g:airline#extensions#tabline#left_sep = "\u2b80"
 "let g:airline#extensions#tabline#left_alt_sep = "\u2b81"
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""MiniBufExplorer
""""""""提供多文件同时编辑功能，并在编辑器上方显示文件的标签
Bundle 'fholgado/minibufexpl.vim'
"let loaded_minibufexplorer = 1
"<C-Tab>向前/<C-S-Tab>后循环切换到每个buffer上,并在当前窗口打开
let g:miniBufExplMapCTabSwitchBufs = 1
"用<C-箭头键>切换到上下左右窗口中去
let g:miniBufExplMapWindowNavArrows = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""showmarks
Bundle 'ShowMarks7'
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
" 只显示全部的大写标记和小写，并高亮这两种标记
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
" 对文件类型为help、quickfix和不可修改的缓冲区，则不显示标记的位置
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks整行高亮
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 
"showmarks    - 快捷键
"<Leader>mt   - 打开/关闭ShowMarks插件
"<Leader>mo   - 强制打开ShowMarks插件
"<Leader>mh   - 清除当前行的标记
"<Leader>ma   - 清除当前缓冲区中所有的标记
"<Leader>mm   - 在当前行打一个标记，使用下一个可用的标记名 
"""""""""""""""""""""""""""""""""""""""""""""""""markbrowser
Bundle 'aur-archive/vim-markbrowser'
nmap <silent> <Leader>mb :MarksBrowser<CR> 
""""""""""""""""""""""""""""""""""""""""""""""NERD_commenter
Bundle 'redguardtoo/evil-nerd-commenter'
" \cc 注释当前行和选中行  
" \cn 没有发现和\cc有区别  
" \c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作  
" \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释  
" \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释  
" \cs 添加性感的注释，代码开头介绍部分通常使用该注释  
" \cy 添加注释，并复制被添加注释的部分  
" \c$ 注释当前光标到该行结尾的内容  
" \cA 跳转到该行结尾添加注释，并进入编辑模式  
" \ca 转换注释的方式，比如： /**/和//  
" \cl \cb 左对齐和左右对其，左右对其主要针对/**/  
" \cu 取消注释  
""""""""""""""""""""""""""""""""""""""""""""""""""TxtBrowser
"required_______TxtBrowser.vim
Bundle 'TxtBrowser'
let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
au BufRead,BufNewFile *.txt setlocal ft=txt
"___________________TxtBrowser
"<Leader>s: 用搜索引擎(可定制, 默认为google)搜索光标下的单词或选中的文本.
"<Leader>f: 用网络字典(可定制, 默认为google.cn)对光标下的单词或选中的文本查字典.
"<Leader>g: 打开光标下或选中的URL.
"<Leader>h: 高亮光标下的单词或选中的文本(可跨行).
"*:	向前搜索光标下的单词或选中的文本(可跨行)
"?:	向后搜索光标下的单词或选中的文本(可跨行)
""""""""""""""""""""""""""""""
" xptemplate  
let g:xptemplate_vars = "SParg=&BRfun= &BRloop= "   " 代码紧贴括号,函数名单行,花括号不对齐  
let php_noShortTags = 1                             " 禁用php短标记  
let g:xptemplate_brace_complete = "([{\""         " 括号引号自动补全，部分代码缩进有问题  
"""""""""""""""""""""""""""""""""""""""""""""""""""Markdown
Bundle 'Markdown'
Bundle 'Markdown-syntax'
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
"禁用了vim-markdown的自动折叠
let g:vim_markdown_folding_disabled=1
"""""""""""""""""""""""""""""""""""""""""""""""""""tabular
Bundle 'godlygeek/tabular'
""""""""""""""""""""""""""""""""""""""""""""""""""""tabula
Bundle 'drmingdrmer/xptemplate'
""""""""""""""""""""""""""""""""""""""""""""""""""""""映射
Bundle 'scrooloose/nerdtree.git'
""""""""""""""""""""""""""""""""""""""""""""""""""""""映射
"执行更新_vimrc
nmap ,vimu :surce $VIM/_vimrc<CR>
"新窗编辑_vimrc
nmap <Leader>om :vs $VIM/_vimrc<CR>
nmap <Leader>em :e $VIM/_vimrc<CR>
"打开host文件
nmap ,ehost :e C:\Windows\System32\drivers\etc\hosts<CR>
nmap ,ohost :vs C:\Windows\System32\drivers\etc\hosts<CR>
" 插入匹配括号
"	inoremap () ()<LEFT>
"	inoremap [] []<LEFT>
"	inoremap { {<CR>}<ESC>O
"	inoremap <> <><LEFT>
"	inoremap '' ''<LEFT>
"	inoremap "" ""<LEFT>

" Ctrl + H		光标左移一格
imap <C-H> <Left>
" Ctrl + L		光标右移一格
imap <C-L> <Right>
" Ctrl + J		光标至下一行首
imap <C-J> <ESC><Down>I
" Ctrl + K		光标至上一行尾
imap <C-K> <ESC><Up>A
"搜索完后按esc去掉高亮
nnoremap <ESC> :nohl<cr>
""""""""""""""""""""""""""""""
"插件映射
""""""""""""""""""""""""""""""
set fdm=manual
""""""""""""""""""""""""""""""
"设置
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"识别文件类型
"set filetype = html
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""设置WinManager""""""""
""""""""""""""""""""""""""""""
"FileExplorer窗口和BufExplorer共用一个窗口，在BufExplorer窗口中使用”CTRL-N“可以切换到FileExplorer窗口，再使用一次则又切换回BufExplorer窗口
"在变量g:winManagerWindowLayout中，使用”,”分隔的插件，在同一个窗口中显示，使用”CTRL-N“在不同插件间切换；使用”|”分隔的插件，则在另外一个窗口中显示。
"let g:winManagerWindowLayout = 'TagList,BufExplorer'
"let g:winManagerWindowLayout = 'FileExplorer,BufExplorer|TagList'
"let g:winManagerWindowLayout = 'FileExplorer|TagList'
"WinManager映射
"nmap ,wm :WMToggle<CR>
"设置winmanager的宽度，默认为25
"let g:winManagerWidth = 30
"在进入vim时自动打开/关闭winmanager___Auto___Open__
"let g:AutoOpenWinManager = 1
