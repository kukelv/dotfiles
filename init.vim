" Plugs
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dense-analysis/ale'
  Plug 'rafi/awesome-vim-colorschemes'
"  Plug 'sbdchd/neoformat'
call plug#end()

" Plug customization
let g:bufExplorerSplitHorzSize=15
let g:airline_theme='wombat'

" Visuals
set nu
set termguicolors
colorscheme wombat256mod
filetype plugin indent on
hi ALEWarning guibg=Purple
hi ALEError guibg=DarkRed
hi Normal guibg=Black

" Mappings
"let g:no_ocaml_maps=1
nnoremap <Leader>l :set list!<CR>
nnoremap <Leader><Tab> :NERDTreeToggle<CR>
nnoremap <Leader>be :BufExplorerHorizontalSplit<CR>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>f :ALEFix<CR>

map j gj
map k gk

" Whitespace
set smartindent
set ts=2
set sw=2
set expandtab

" Misc
set mouse=a
set shortmess=A
set hidden
set wildmenu
set wildmode=longest:full,full
set cmdheight=2

" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ALE
let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
let g:ale_linters_explicit            = 1
let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 0
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 0

let g:ale_linters = {
\   'ocaml':      ['merlin'],
\}

let g:ale_fixers = {
\   'ocaml':      ['ocamlformat'],
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}

