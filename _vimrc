""""""""""""""""""""""""""""""
"��������
""""""""""""""""""""""""""""""
"��ʾ�к�
set number
"��ʾ��������
set ruler
color elflord
"����Tab���Ŀ��
set shiftwidth=4
set tabstop=4
"�����м��
set linespace=8
"�����Զ�����
set noautoindent
""""""""""""""""""""""""""""""
"��������Consolas
"set guifont=Consolas:h11
set guifont=SourceCodePro-Regular:h11  
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
""""""""""""""""""""""""""""""
"���ݱ༭ģʽ�������뷨�����ɫ��ͬʱ����IME�Զ��л�
if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Orange gui=NONE
    hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
    set iminsert=0 imsearch=0
endif
"��Windows���������
set clipboard+=unnamed
"�༭vimrc֮�����¼���
"autocmd! bufwritepost _vimrc source $VIM/_vimrc
"��ʱ����������
set incsearch
set hlsearch
""""""""""""""""""""""""""""""
"���ñ���
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8
""""""""""""""""""""""""""""""
"���ò�����
set nobackup
set nowritebackup
set noswapfile
""""""""""""""""""""""""""""""
" �趨doc�ĵ�Ŀ¼
"let helptags=$VIMFILES.'/doc'
""""""""""""""""""""""""""""""
"�Ա��ĵ�
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
"Vundle��·��
set rtp+=$VIM/vimfiles/bundle/vundle.vim 
" alternatively, pass a path where Vundle should install plugins
"����İ�װ·��
"call vundle#begin('~/some/path/here')
call vundle#rc('$VIM/vimfiles/bundle')  
Bundle 'gmarik/vundle'
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""tags
"set tags =/
"�Զ����ϼ���tag
set tags=tags;
set autochdir
" ����F8��������tag�ļ���������taglist
"map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""taglist
Bundle 'taglist.vim'
let Tlist_Auto_Open = 1	"����vim���Զ���/�ر�taglist����__Auto__Open__
let Tlist_Show_Menu = 0	"��gvim�У��Զ���ʾ/����taglist�˵�
let Tlist_Show_One_File = 1	"��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1	"���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_SingleClick = 0	"��/˫��tag��ת
let Tlist_Use_Right_Window = 0	"����/�Ҳര������ʾtaglist����(Ĭ�������)
"let Tlist_Show_Menu=1	"��ʾtaglist�˵�
"let Tlist_GainFocus_On_ToggleOpen = 1	"TlistToggle��taglist,���뽹����taglist������
"Tlist_WinHeight��Tlist_WinWidth��������taglist���ڵĸ߶ȺͿ�ȡ�
"Tlist_Use_Horiz_WindowΪ������taglist���ں�����ʾ��
"Tlistӳ��
nmap ,tl :TlistToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""BufExplorer
let g:bufExplorerDefaultHelp=0    " Do not show default help
""""""""""""""""""""""""""""""""""""""""""""""""vim-airline
"״̬����ǿ���,������buffer��ʾ����չsmart tab line�Լ�������һЩ���"
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
let g:airline_theme="luna" 
"����ǰ�װ����� �������ô���" 
let g:airline_powerline_fonts = 1   
"��tabline����,����鿴Buffer���л���������ܱȽϲ���"
"�һ�ʡȥ��minibufexpl�������Ϊ��ϰ����1��Tab���ö��buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" ����consolas����"
"set guifont=Consolas\ for\ Powerline\ FixedD:h11

"����״̬��������ʾ�����������˫����"
 " let g:Powerline_symbols="fancy"
 " let g:airline_symbols = {}
 " let g:airline_left_sep = "\u2b80" 
 " let g:airline_left_alt_sep = "\u2b81"
 " let g:airline_right_sep = "\u2b82"
 " let g:airline_right_alt_sep = "\u2b83"
 " let g:airline_symbols.branch = "\u2b60"
 " let g:airline_symbols.readonly = "\u2b64"
 " let g:airline_symbols.linenr = "\u2b61"
  "�����л�Buffer��ݼ�"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>
 "���ö���tabline��������ʾ"
 "let g:airline#extensions#tabline#left_sep = "\u2b80"
 "let g:airline#extensions#tabline#left_alt_sep = "\u2b81"
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""MiniBufExplorer
""""""""�ṩ���ļ�ͬʱ�༭���ܣ����ڱ༭���Ϸ���ʾ�ļ��ı�ǩ
Bundle 'fholgado/minibufexpl.vim'
"let loaded_minibufexplorer = 1
"<C-Tab>��ǰ/<C-S-Tab>��ѭ���л���ÿ��buffer��,���ڵ�ǰ���ڴ�
let g:miniBufExplMapCTabSwitchBufs = 1
"��<C-��ͷ��>�л����������Ҵ�����ȥ
let g:miniBufExplMapWindowNavArrows = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""showmarks
Bundle 'ShowMarks7'
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
" ֻ��ʾȫ���Ĵ�д��Ǻ�Сд�������������ֱ��
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
" ���ļ�����Ϊhelp��quickfix�Ͳ����޸ĵĻ�����������ʾ��ǵ�λ��
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks���и���
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 
"showmarks    - ��ݼ�
"<Leader>mt   - ��/�ر�ShowMarks���
"<Leader>mo   - ǿ�ƴ�ShowMarks���
"<Leader>mh   - �����ǰ�еı��
"<Leader>ma   - �����ǰ�����������еı��
"<Leader>mm   - �ڵ�ǰ�д�һ����ǣ�ʹ����һ�����õı���� 
"""""""""""""""""""""""""""""""""""""""""""""""""markbrowser
Bundle 'aur-archive/vim-markbrowser'
nmap <silent> <Leader>mb :MarksBrowser<CR> 
""""""""""""""""""""""""""""""""""""""""""""""NERD_commenter
Bundle 'redguardtoo/evil-nerd-commenter'
" \cc ע�͵�ǰ�к�ѡ����  
" \cn û�з��ֺ�\cc������  
" \c<�ո�> �����ѡ�����в��ֱ�ע�ͣ���Ա�ѡ����ִ��ȡ��ע�Ͳ������������ִ�з�תע�Ͳ���  
" \cm �Ա�ѡ������һ��ע�ͷ�����ע�ͣ�ǰ���ע�Ͷ�ÿһ�ж������ע��  
" \ci ִ�з�תע�Ͳ�����ѡ������ע�Ͳ���ȡ��ע�ͣ���ע�Ͳ������ע��  
" \cs ����Ըе�ע�ͣ����뿪ͷ���ܲ���ͨ��ʹ�ø�ע��  
" \cy ���ע�ͣ������Ʊ����ע�͵Ĳ���  
" \c$ ע�͵�ǰ��굽���н�β������  
" \cA ��ת�����н�β���ע�ͣ�������༭ģʽ  
" \ca ת��ע�͵ķ�ʽ�����磺 /**/��//  
" \cl \cb ���������Ҷ��䣬���Ҷ�����Ҫ���/**/  
" \cu ȡ��ע��  
""""""""""""""""""""""""""""""""""""""""""""""""""TxtBrowser
"required_______TxtBrowser.vim
Bundle 'TxtBrowser'
let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
au BufRead,BufNewFile *.txt setlocal ft=txt
"___________________TxtBrowser
"<Leader>s: ����������(�ɶ���, Ĭ��Ϊgoogle)��������µĵ��ʻ�ѡ�е��ı�.
"<Leader>f: �������ֵ�(�ɶ���, Ĭ��Ϊgoogle.cn)�Թ���µĵ��ʻ�ѡ�е��ı����ֵ�.
"<Leader>g: �򿪹���»�ѡ�е�URL.
"<Leader>h: ��������µĵ��ʻ�ѡ�е��ı�(�ɿ���).
"*:	��ǰ��������µĵ��ʻ�ѡ�е��ı�(�ɿ���)
"?:	�����������µĵ��ʻ�ѡ�е��ı�(�ɿ���)
""""""""""""""""""""""""""""""
" xptemplate  
let g:xptemplate_vars = "SParg=&BRfun= &BRloop= "   " �����������,����������,�����Ų�����  
let php_noShortTags = 1                             " ����php�̱��  
let g:xptemplate_brace_complete = "([{\""         " ���������Զ���ȫ�����ִ�������������  
"""""""""""""""""""""""""""""""""""""""""""""""""""Markdown
Bundle 'Markdown'
Bundle 'Markdown-syntax'
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
"������vim-markdown���Զ��۵�
let g:vim_markdown_folding_disabled=1
"""""""""""""""""""""""""""""""""""""""""""""""""""tabular
Bundle 'godlygeek/tabular'
""""""""""""""""""""""""""""""""""""""""""""""""""""tabula
Bundle 'drmingdrmer/xptemplate'
""""""""""""""""""""""""""""""""""""""""""""""""""""""ӳ��
Bundle 'scrooloose/nerdtree.git'
""""""""""""""""""""""""""""""""""""""""""""""""""""""ӳ��
"ִ�и���_vimrc
nmap ,vimu :surce $VIM/_vimrc<CR>
"�´��༭_vimrc
nmap <Leader>om :vs $VIM/_vimrc<CR>
nmap <Leader>em :e $VIM/_vimrc<CR>
"��host�ļ�
nmap ,ehost :e C:\Windows\System32\drivers\etc\hosts<CR>
nmap ,ohost :vs C:\Windows\System32\drivers\etc\hosts<CR>
" ����ƥ������
"	inoremap () ()<LEFT>
"	inoremap [] []<LEFT>
"	inoremap { {<CR>}<ESC>O
"	inoremap <> <><LEFT>
"	inoremap '' ''<LEFT>
"	inoremap "" ""<LEFT>

" Ctrl + H		�������һ��
imap <C-H> <Left>
" Ctrl + L		�������һ��
imap <C-L> <Right>
" Ctrl + J		�������һ����
imap <C-J> <ESC><Down>I
" Ctrl + K		�������һ��β
imap <C-K> <ESC><Up>A
"�������escȥ������
nnoremap <ESC> :nohl<cr>
""""""""""""""""""""""""""""""
"���ӳ��
""""""""""""""""""""""""""""""
set fdm=manual
""""""""""""""""""""""""""""""
"����
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"ʶ���ļ�����
"set filetype = html
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""����WinManager""""""""
""""""""""""""""""""""""""""""
"FileExplorer���ں�BufExplorer����һ�����ڣ���BufExplorer������ʹ�á�CTRL-N�������л���FileExplorer���ڣ���ʹ��һ�������л���BufExplorer����
"�ڱ���g:winManagerWindowLayout�У�ʹ�á�,���ָ��Ĳ������ͬһ����������ʾ��ʹ�á�CTRL-N���ڲ�ͬ������л���ʹ�á�|���ָ��Ĳ������������һ����������ʾ��
"let g:winManagerWindowLayout = 'TagList,BufExplorer'
"let g:winManagerWindowLayout = 'FileExplorer,BufExplorer|TagList'
"let g:winManagerWindowLayout = 'FileExplorer|TagList'
"WinManagerӳ��
"nmap ,wm :WMToggle<CR>
"����winmanager�Ŀ�ȣ�Ĭ��Ϊ25
"let g:winManagerWidth = 30
"�ڽ���vimʱ�Զ���/�ر�winmanager___Auto___Open__
"let g:AutoOpenWinManager = 1
