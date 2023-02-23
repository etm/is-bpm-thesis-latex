set spell spelllang=en_us
set spellfile=paper.add
set nosmartindent

set wrap linebreak nolist
set virtualedit=
setlocal display+=lastline
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
:set showbreak=→\


set commentstring=%%s
map <F1> lbi\textit{<ESC>ea}<ESC>
vmap <F1> :<HOME><DEL><DEL><DEL><DEL><DEL>s/\%V\(.*\)\%V./\\textit{\0}/g<CR>
map <F2> lbi\textbf{<ESC>ea}<ESC>
vmap <F2> :<HOME><DEL><DEL><DEL><DEL><DEL>s/\%V\(.*\)\%V./\\textbf{\0}/g<CR>
map <F3> lbi\texttt{<ESC>ea}<ESC>
vmap <F3> :<HOME><DEL><DEL><DEL><DEL><DEL>s/\%V\(.*\)\%V./\\texttt{\0}/g<CR>
map <F4> lbi\text{<ESC>ea}<ESC>
vmap <F4> :<HOME><DEL><DEL><DEL><DEL><DEL>s/\%V\(.*\)\%V./\\text{\0}/g<CR>
map <F5> i\begin{itemize}<CR>\end{itemize}<ESC><UP>o  \item
map <F6> o\item
map <F7> :!evince paper.pdf >/dev/null 2>/dev/null&<CR>
map <F8> :!cd images;make<CR>
map <F10> :!touch paper.latex<CR>:!make<CR>
map <F9> :!make bib<CR>
