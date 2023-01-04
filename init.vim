" Plugs
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dense-analysis/ale'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'jabirali/vim-tmux-yank'
"  Plug 'sbdchd/neoformat'
call plug#end()

" Plug customization
let g:bufExplorerSplitHorzSize=15
let g:airline_theme='wombat'

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'wombat'
    let s:cterm_errorbg   = 160         " Background for error blocks
    let s:gui_errorbg     = '#D70000'
    let s:cterm_errorfg   = 15          " Foreground for error blocks
    let s:gui_errorfg     = '#DDDDDD'
    let s:E = [s:gui_errorfg, s:gui_errorbg, s:cterm_errorfg, s:cterm_errorbg, 'bold']
    let g:airline#themes#wombat#palette.normal.airline_error = s:E
    let g:airline#themes#wombat#palette.normal_modified.airline_error = s:E
  endif
endfunction

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
"nnoremap <Leader><Tab> :NERDTreeFind<CR>
nnoremap <Leader><Tab> :NERDTreeToggle<CR>
nnoremap <Leader>be :BufExplorerHorizontalSplit<CR>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>f :ALEFix<CR>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

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
set ignorecase

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

