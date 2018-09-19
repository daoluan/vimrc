if len(argv()) == 0
    autocmd VimEnter * NERDTree
endif

map  :silent! NERDTreeToggle
let NERDTreeIgnore += ['\.o$','\.d$', 'tags']

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""""
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1"在右侧窗口中显示taglist窗口
map <leader>tt :TlistToggle<cr>

" ctags 分析
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

syntax on
let g:solarized_termcolors=256
set background=light " 如果需使用 dark 必须先设置 light...
colorscheme solarized
set background=dark

" map control-backspace to delete the previous word
:imap <C-BS> <C-W>

" 编码
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030,cp936

" 保存/退出快捷键
map Q :q<cr>
nmap <leader>Q :qa<cr>
map <leader>C :wa<cr>:sh<cr>
map <leader>[ :wa<cr>:make<cr>

" 关闭静态检测，可以手动打开
let g:syntastic_mode_map = {'mode': 'passive'}

" 注释风格
autocmd FileType c,cpp set commentstring=//\ %s

" 鼠标
" set mouse=a
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

" 去除行尾的空白
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,py,cc,h autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 如果不需要，直接删除，重写了 basic.vim 里的设置
" 1 tab == 2 spaces
" set shiftwidth=2
" set tabstop=2

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

autocmd FileType c,cc,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw<cr>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" Search for visually selected text
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
" select the text visually and press '//'
vnoremap // y/<C-R>"<CR>N
let g:clang_format#code_style = "google"
let g:clang_format#style_options = {"IndentWidth":2}
let g:clang_format#auto_format = 1
autocmd FileType cpp setlocal omnifunc=libclang#Complete
autocmd FileType c setlocal omnifunc=libclang#Complete
autocmd FileType cpp ClangFormatAutoEnable

let g:ycm_path_to_python_interpreter='/usr/bin/python'
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" path to your ycm_extra_conf
let g:ycm_global_ycm_extra_conf = '~/.vim_runtime/sources_non_forked/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR> 

" autopep8
let g:autopep8_disable_show_diff=1
" format on save
autocmd BufWritePost *.py Autopep8

"打开vim时不再询问是否加载ycm_extra_conf.py配置"
"let g:ycm_confirm_extra_conf=0
"set completeopt=longest,menu
""python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/bin/python'
"是否开启语义补全"
"let g:ycm_seed_identifiers_with_syntax=1
""是否在注释中也开启补全"
" let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=0
""补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
" 字符串中也开启补全"
let g:ycm_complete_in_strings = 1
" 离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_max_num_candidates = 10

" solve confilict in vim-surround and vim-yankstack
call yankstack#setup()

" let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:pymode_rope = 0
let g:pymode_folding=0

" ultisnips config
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:email="g.daoluan@gmail.com"

let g:ycm_python_binary_path = '/usr/local/bin/python3'

set nu

" js beautify
autocmd BufWritePost *.js :call JsBeautify() 
autocmd BufWritePost *.json :call JsonBeautify() 
autocmd BufWritePost *.jsx :call JsxBeautify() 
autocmd BufWritePost *.html :call HtmlBeautify() 
autocmd BufWritePost *.css :call CSSBeautify() 

" set js indent
autocmd BufNewFile,BufRead *.js :setl sw=2 sts=2 et

" let g:vim_markdown_folding_disabled = 1
