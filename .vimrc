source /Users/isen0011/.asrvimrc

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vader.vim'
Plug 'scrooloose/nerdtree'
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-vinegar'
Plug 'zxqfl/tabnine-vim'
Plug 'tpope/vim-surround'
Plug 'isen0011/vim-rspec', { 'branch': 'add_cucumber_feature_files' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'wincent/ferret'
Plug 'rizzatti/dash.vim'
Plug 'tomtom/tcomment_vim'
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }

call plug#end()

"" Format columns at 80 & 120 characters
let &colorcolumn="80,".join(range(120,999),",")

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm2"

" for Rspec.vim, change the rspec auto-run command to be script/test
autocmd BufRead,BufNewFile /Users/isen0011/sites/student_athletes/* let g:rspec_command = "/Users/isen0011/sites/student_athletes/script/test {spec}"

" Dash mappings
nmap <silent> <leader>d <Plug>DashSearch

" command-t mappings
nmap <silent> <leader>f :CommandT<CR>

" auto-complete settings
syntax on
filetype on
filetype indent on
filetype plugin on

" ferret mappings
nmap <Leader>g <Plug>(FerretAck)
nmap <Leader>r <Plug>(FerretAckWord)

" CTags mappings
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags+=.git/tags

" scrooloose/nerdtree mappings
nmap <C-n> :NERDTreeToggle<CR>
nmap <leader>h :NERDTreeFind<CR>

" C# formatting - format .aspx files as html
au BufReadPost *.ezt set syntax=html
autocmd FileType aspx setlocal shiftwidth=2 tabstop=2

" buffer navigation shortcuts
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" General formatting stuff
set ruler

" Spell checking
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" exercism test shortcut
function! s:exercism_tests()
  if expand('%:e') == 'vim'
    let testfile = printf('%s/%s.vader', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(testfile)
      echoerr 'File does not exist: '. testfile
      return
    endif
    source %
    execute 'Vader' testfile
  else
    let sourcefile = printf('%s/%s.vim', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(sourcefile)
      echoerr 'File does not exist: '. sourcefile
      return
    endif
    execute 'source' sourcefile
    Vader
  endif
endfunction

autocmd BufRead *.{vader,vim}
      \ command! -buffer Test call s:exercism_tests()
