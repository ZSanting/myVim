syntax on
set guifont=Monaco:h16
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set number              " 显示行号
set background=dark     " 深色主题
colorscheme solarized   " 使用solarized主题
set cursorline			" 突出显示当前行"
set incsearch			" 即刻查找,输入一个字符马上自动匹配,而不是输入完再查找
set hlsearch			" 高亮搜索项"
set fenc=utf-8			" 文件编码"
set autochdir           " 自动切换当前目录为当前文件所在的目录
set laststatus=2        " 底部第二行显示状态栏
set completeopt-=preview    " 关闭函数功能描述信息
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
let mapleader = ','

" 折叠设置
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠,manual
set foldcolumn=0            " 设置折叠区域的宽度
set foldlevel=2        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码
" set foldclose=all          " 设置为自动关闭折叠

" Python缩进配置
set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python
set autoindent			" same level indent
set smartindent			" next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> noremap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Vundle(插件管理工具)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              			" be iMproved, required
filetype off                  			" required
set rtp+=~/.vim/bundle/Vundle.vim		" 启用vundle来管理vim插件
call vundle#begin()						" 安装插件写在这之后
Plugin 'VundleVim/Vundle.vim'			" let Vundle manage Vundle, required
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tell-k/vim-autopep8'
Plugin 'vim-scripts/taglist.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'			"辅助线
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tpope/vim-fugitive'             "Fugitive: Git 集成
Plugin 'scrooloose/nerdcommenter'       "批量注释
" Plugin 'alvan/vim-closetag'          "成对标签补全
Plugin 'w0rp/ale'                       "ale,语法检查插件
Plugin 'ntpeters/vim-better-whitespace'    "检查末尾空格
call vundle#end()						" 安装插件写在这之前
filetype plugin on    					" required


"""""""""""""""""""
"YouCompleteMe配置
""""""""""""""""""""
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

"""""""""""""""""""
"ale配置
""""""""""""""""""""
let &runtimepath.=',~/.vim/bundle/ale'	" ale,语法检查插件
let g:ale_python_pylint_executable = 'python'
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'
let g:ale_python_pylint_use_global = 0  " The virtualenv detection needs to be disabled.

"""""""""""""""""""
"Chiel92/vim-autoformat配置
""""""""""""""""""""
map <leader>f :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatter_yapf_style = 'pep8'

"""""""""""""""""""
"vim-better-whitespace配置
""""""""""""""""""""
map <leader><space> :StripWhitespace<CR>

"""""""""""""""""""
" vim text rerender
"""""""""""""""""""
map <Leader>r :!defaults write org.vim.MacVim MMUseCGLayerAlways -bool YES<CR>

"""""""""""""""""""
" scrooloose/nerdtree
"""""""""""""""""""
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

"""""""""""""""""""
" vim-nerdtree-tabs
"""""""""""""""""""
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>m <plug>NERDTreeMirrorToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0

"""""""""""""""""""
" scrooloose/nerdcommenter
"""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""
"colsetag
"""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,xml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
