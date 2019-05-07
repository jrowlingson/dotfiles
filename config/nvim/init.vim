" .vimrc / init.vim
" The following vim/neovim configuration works for botom vim and neovim

" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

" General {{{

  set autoread
  set hidden

  set noswapfile
  set history=1000
  set textwidth=120

  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

  set backspace=indent,eol,start " make backspace behave in a sane manner
  set clipboard=unnamed

  if has('mouse')
    set mouse=a
  endif

  " Searching
  set ignorecase
  set smartcase
  set incsearch
  set nolazyredraw
  set nohlsearch

  set magic " Set magic on, for regex

  " error bells
  set noerrorbells
  set visualbell
  set t_vb=
  set tm=500

" }}}

" Appearance {{{
  set autoindent      " enable auto indent
  set linebreak       " set soft wrapping
  set mat=2
  set number          " show line numbers
  set relativenumber
  set shell=$SHELL
  set showmatch       " show matching braces
  set smartindent     " does the right thing (mostly) in programs
  set ttyfast         " fast redraw
  set wrap            " enable line wrapping

  " Tab control
  set tabstop=2      " number of spaces tab accounts for
  set expandtab      " don't use actual tab character (ctrl-v)
  set shiftwidth=2   " indenting is 2 spaces
  set softtabstop=2  " edit as if the tabs are 2 chars

  set t_co=256       " explicitly tell vim that the terminal supports 256 colors

  " enable 24 bit color if supported
  if (has("termguicolors"))
    set termguicolors
  endif

" }}}


" General Mappings {{{
  " set a map leader for more key combos
  let mapleader = ','

  nmap <silent> <leader>a :Rg<cr>

  nnoremap Y y$

  " remap esc
  inoremap jk <esc>

  inoremap {<CR> {<CR>}<ESC>O

  " shortcut to save
  nmap <leader>, :w<cr>
  nmap <leader>n :set relativenumber!<cr>

  map <leader>ev :e! ~/.config/nvim/init.vim<cr>

  " switch between current and last buffer
  nmap <leader>. <c-^>

  map <silent> <C-h> :call functions#WinMove('h')<cr>
  map <silent> <C-j> :call functions#WinMove('j')<cr>
  map <silent> <C-k> :call functions#WinMove('k')<cr>
  map <silent> <C-l> :call functions#WinMove('l')<cr>

" }}}

" Plugins {{{

  Plug 'arthurxavierx/vim-caser'
  Plug 'SirVer/ultisnips'
  Plug 'benmills/vimux'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'sickill/vim-pasta'
  Plug 'joukevandermaas/vim-ember-hbs'
  Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
  Plug 'chriskempson/base16-vim'
  Plug 'christoomey/vim-sort-motion'
  " Plug 'TaDaa/vimade'
  " Plug 'HerringtonDarkholme/yats.vim' " typescript syntax
  " Plug 'joshdick/onedark.vim'

" }}}

" LightLine {{{
    Plug 'itchyny/lightline.vim'
    Plug 'nicknisi/vim-base16-lightline'
    let g:lightline = {
    \   'colorscheme': 'base16',
    \ }
" }}}

" FZF {{{
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'down': '~25%' }

    if isdirectory(".git")
        " if in a git project, use :GFiles
        nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
    else
        " otherwise, use :FZF
        nmap <silent> <leader>t :FZF<cr>
    endif

    nmap <silent> <leader>s :GFiles?<cr>

    nmap <silent> <leader>r :Buffers<cr>
    nmap <silent> <leader>e :FZF<cr>
    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

    nnoremap <silent> <Leader>C :call fzf#run({
    \   'source':
    \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
    \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
    \   'sink':    'colo',
    \   'options': '+m',
    \   'left':    30
    \ })<CR>

    command! FZFMru call fzf#run({
    \  'source':  v:oldfiles,
    \  'sink':    'e',
    \  'options': '-m -x +s',
    \  'down':    '40%'})

    command! -bang -nargs=* Find call fzf#vim#grep(
        \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
        \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
    command! -bang -nargs=? -complete=dir GitFiles
        \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
" }}}

call plug#end()

" AutoGroups {{{
  augroup write_commands
      autocmd BufWritePre * %s/\s\+$//e
  augroup end
" }}}

" Colorscheme and final setup {{{
    " This call must happen after the plug#end() call to ensure
    " that the colorschemes have been loaded
    " let base16colorspace=256
    " colorscheme base16-default-dark
    " let g:onedark_termcolors=16
    " colorscheme onedark
    if filereadable(expand("~/.vimrc_background"))
      let base16colorspace=256
      source ~/.vimrc_background
    endif
" }}}

" allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" vim:set foldmethod=marker foldlevel=0
