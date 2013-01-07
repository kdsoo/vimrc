" Author: Dongsoo Kim<dongsoo.kim@gmail.com>
"
set tags=./tags,/usr/src/linux/tags,/usr/include/tags
set number

" To use pathogen, follow this command
" mkdir -p ~/.vim/autoload ~/.vim/bundle; \
" curl -so ~/.vim/autoload/pathogen.vim \
" https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
call pathogen#infect()

set csprg=/usr/bin/cscope
set csto=0
set cst
set mouse=a
set ttymouse=xterm2 
set nocsverb
set encoding=utf-8
"set sw=4
"set tabstop=8
"set expandtab
set autoindent
set cindent
set smartindent
set ruler
set wmnu
set lpl
set ic
set scs
set sc
set sm
set sel=exclusive
set incsearch
set cc=80
hi ColorColumn ctermbg=lightblue guibg=lightblue

" Feel like IDE...kdsoo
filetype indent on
syntax on
filetype plugin on
set ofu=syntaxcomplete#Complete

" build script assign
" set makeprg=../build.sh

abbr #b /*********************************************************
abbr #e *********************************************************/

"color advantage
"color impact
color billw
set guifont="Bitstream Vera Sans Mono" \ 11

if $LANG[0] == 'k' && $LANG[1] == 'o'
set fileencoding=korea
endif

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

if filereadable("./cscope.out")
        cs add cscope.out
else
        cs add /home/share/linux/cscope.out
endif
set csverb

if version >= 500
func! Sts()
        let st = expand("<cword>")
        exe "sts ".st
endfunc
nmap ,st :call Sts()<cr>

func! Tj()
        let st = expand("<cword>")
        exe "tj ".st
endfunc
nmap ,tj :call Tj()<cr>
endif

map ,1 :b!1<CR>
map ,2 :b!2<CR>
map ,3 :b!3<CR>
map ,4 :b!4<CR>
map ,5 :b!5<CR>
map ,6 :b!6<CR>
map ,7 :b!7<CR>
map ,8 :b!8<CR>
map ,9 :b!9<CR>
map ,0 :b!0<CR>
map ,w :b!bw<CR>

map <F1> v]}zf

nnoremap <silent> <F2> :copen<CR>
nnoremap <silent> <F3> :cclose<CR>
nnoremap <silent> <F4> :make -j $PWD<CR> :cw 7<CR>
nnoremap <silent> <F5> :cs find f 
nnoremap <silent> <F6> :BufExplorer<CR>
nnoremap <silent> <F7> :Tlist<CR>
nnoremap <silent> <F8> :mksession!<CR>

func! Man( )
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap <F9> :call Man( )<cr><cr>

nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-[>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Show trailing whitespace and spaces before tabs
hi link localWhitespaceError Error
au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/ display
au Syntax * syn match localWhitespaceError / \+\ze\t/ display
