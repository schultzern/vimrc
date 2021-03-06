" My VIM preferences


" Colorscheme
colorscheme onedark

" Font
" Set in terminal

" Div 
set number      " Show line numbers in the gutter
set list        " Show invisibles for eol, tab trail etc.
                " which characters to use is defined below
set listchars=eol:$,tab:>-,trail:¤,extends:>,precedes:<
                " To unset: ":set nolist"

" syntax on
" set syntax=whitespace

" Indenting and tabs
set tabstop=8         " number of spaces for hardtab
set softtabstop=4     " number of spaces inserted when tab key is pushed
set expandtab         " when set inserts softtabstop number of spaces
set shiftwidth=4
set autoindent

" set smartindent
" set cindent

" My mappings: wincmd = ctrl-W
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" disable folding
set nofoldenable

" Activate mouse. Double right click on links will navigat.
set mouse=a

" Set clipboard to system clipboard
set clipboard=unnamedplus

" Config Syntastic for c++
let g:syntastic_check_on_wq = 0

let g:syntastic_c_checkers = ['cppcheck', 'clang_check']
let g:syntastic_c_include_dirs = [ '../inc', 'inc', '../include', 'include']
let g:syntastic_c_check_header = 1

let g:syntastic_cpp_checkers = ['cppcheck', 'clang_check']
let g:syntastic_cpp_include_dirs = [ '../inc', 'inc', '../include', 'include']
let g:syntastic_cpp_check_header = 1

" RTags configuration
set completefunc=RtagsCompleteFunc
let g:rtagsUseLocationList = 0
" Neocomplete function for RTags
function! SetupNeocomleteForCppWithRtags()
    " Enable heavy omni completion.
    setlocal omnifunc=RtagsCompleteFunc

    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let l:cpp_patterns='[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.cpp = l:cpp_patterns 
    set completeopt+=longest,menuone
endfunction

autocmd FileType cpp,cc,c,h,hpp call SetupNeocomleteForCppWithRtags()

" Add line for 110 characters to keep code simple!
" set colorcolumn=110
" highlight ColorColumn ctermbg=darkgrey

" Configure build system; Make
set makeprg=colormake\ -C\ ./\ -j8

" Set split right and bottom
set splitright

" Set options if using spaces for indents (default).
function SpacesCfg()
  set expandtab
  set tabstop=8
  set softtabstop=4
  set shiftwidth=4
endfunction

" Set options if using tabs for indents.
function TabsCfg()
  set noexpandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfunction

"" LaTeX stuff:
" vim-latex-live-preview settings
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'

"" NERDTree
"  Keep it on the left
let g:NERDTreeWinPos = "left"
let g:NERDTreeShowHidden = "1"
