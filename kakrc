evaluate-commands %sh{
    plugins="$kak_config/plugins"
    mkdir -p "$plugins"
    [ ! -e "$plugins/plug.kak" ] && \
        git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
    printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}
plug "andreyorst/plug.kak" noload

plug 'delapouite/kakoune-buffers' %{
  map global normal ^ q
  map global normal <a-^> Q
  map global normal <space> ': enter-user-mode -lock buffers<ret>' -docstring 'buffers'
  map global normal Q ': enter-user-mode buffers<ret>' -docstring 'buffers'
  map global normal q ': info-buffers<ret>' -docstring 'buffers (lock)'
}

plug 'kakounedotcom/prelude.kak'
plug 'kakounedotcom/connect.kak'
require-module prelude
require-module connect

map global normal <c-u> 'kkkkkkkkkk'
map global normal <c-d> 'jjjjjjjjjj'
map global normal <c-r> 'U'
map global normal <a-p> 'oimport pdb; pdb.set_trace()<esc>'
map global normal <a-P> 'Oimport pdb; pdb.set_trace()<esc>'

colorscheme gruvbox
set-option global scrolloff 99999,3

# Disable mouse
set -add global ui_options ncurses_enable_mouse=0

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


# IDE

declare-option -docstring 'Width of file picker in percentage of window' str ide_file_picker_width 30
declare-option -docstring 'File picker command' str ide_file_picker "ranger"

define-command ide %{
    connect ide-file-picker %opt{ide_file_picker}
}

define-command ide-file-picker -params 1.. -shell-completion -docstring '
ide-file-picker <program> [<arguments>]: open file picker panel' \
%{
    tmux-terminal-impl "split-window -hb -p %opt{ide_file_picker_width}" %arg{@}
}
