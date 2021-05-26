map global normal <c-u> 'kkkkkkkkkk'
map global normal <c-d> 'jjjjjjjjjj'
map global normal <c-r> 'U'
map global normal <a-p> 'oimport pdb; pdb.set_trace()<esc>'
map global normal <a-P> 'Oimport pdb; pdb.set_trace()<esc>'
colorscheme gruvbox
set-option global scrolloff 99999,3

# Width of a tab
set-option global tabstop 4
# Indent with 4 spaces
set-option global indentwidth 4
# Line numbers
add-highlighter global/ number-lines -hlcursor
# Highlight trailing whitespace
add-highlighter global/ regex \h+$ 0:Error
# Clipboard management mappings
map -docstring "yank the selection into the clipboard" global user y "<a-|> xsel -i<ret>"
map -docstring "paste the clipboard" global user p "<a-!> xsel<ret>"
