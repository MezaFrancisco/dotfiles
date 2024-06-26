set showmatch
set shiftwidth=4
set tabstop=4



"==================================================plugins settings
for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
  exe 'source' f
endfor

source ~/.vim/bundle.vim

"==================================================general settings
set re=1 " fall back to old regex engine in ruby
syntax enable
set hidden
set bufhidden=delete
set exrc
set secure
set nowrap
set nobackup
set nowritebackup
set noswapfile
set dir=$HOME/.vim/tmp/

set softtabstop=2
set shiftwidth=2
set shiftround "use multiple of shiftwidth when indenting with '<' and '>'
set expandtab

set shell=/bin/zsh
set grepprg=ag\ --nogroup\ --nocolor

set clipboard=unnamed
runtime macros/matchit.vim


"==================================================look & feel
color default
set termguicolors
set laststatus=2    "always show statusbar
set showtabline=1   "always show tabs bar
set number          "show line numbers
set relativenumber  "show line numbers relative to current
set showmatch       "show matching braces
set ttyfast
set lazyredraw
set t_Co=256        "set 256 colors mode
set incsearch       "turn on incremental search
set backspace=indent,eol,start
set scrolloff=3
au InsertEnter * hi StatusLine term=reverse ctermbg=234
au InsertLeave * hi StatusLine term=reverse ctermbg=237

set wildmenu
set wildmode=longest:list,full
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.DS_Store,doc/**,tmp/**,log/**,node_modules/**,vendor/**

"set completeopt=menu,preview
set completeopt=longest,menuone

"==================================================mappings
nmap <leader>ve :tabedit $MYVIMRC<CR>
nmap <leader>t :NERDTreeToggle<CR>


"search and replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

set tags += "tmp/tags"
map <C-r><C-t> :!bundle list --paths=true \| xargs ctags -f tmp/tags -R --exclude=.git --exclude=tmp --exclude=log --langmap="ruby:+.rake.builder.rjs" `pwd`/*<CR><CR>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Kill escape delay
set timeoutlen=300 ttimeoutlen=0

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        exec ':e ' . new_name
        exec ':bd #'
        redraw!
    endif
endfunction
command! RenameFile :call RenameFile()

" Close buffer without closing window
function! BufClose()
  exec ':bp | bd #'
endfunction
command! BC :call BufClose()
cabbrev bc <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'BC' : 'bc')<CR>

map \s :execute "! bundle exec rspec " . bufname("%") . ":" . line(".")<CR>

set t_8f=[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=[48;2;%lu;%lu;%lum  " Ditto

map <leader>f :let @+ = expand("%")<CR>    " copy current filename to clipboard
