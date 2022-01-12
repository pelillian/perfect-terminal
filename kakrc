evaluate-commands %sh{
  plugins="$kak_config/plugins"
  mkdir -p "$plugins"
  [ ! -e "$plugins/plug.kak" ] && \
      git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
  printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}
plug "andreyorst/plug.kak" noload
set-option global plug_always_ensure 'true'

plug 'delapouite/kakoune-buffers' %{
  map global normal ^ q
  map global normal <a-^> Q
  map global normal <space> ': pick-buffers<ret>' -docstring 'pick-buffers'
  map global normal <c-space> ': enter-buffers-mode<ret>' -docstring 'buffers'
  map global normal <c-`> ': enter-buffers-mode<ret>' -docstring 'buffers'
  map global normal q '<space>'
  map global normal <c-q> '<c-space>'
  map global pick-buffers j ': buffer-next<ret>'             -docstring 'next →'
  map global pick-buffers k ': buffer-previous<ret>'         -docstring 'previous ←'
  map global buffers j ': buffer-next<ret>'             -docstring 'next →'
  map global buffers k ': buffer-previous<ret>'         -docstring 'previous ←'
}

plug 'kakounedotcom/prelude.kak'
plug 'kakounedotcom/connect.kak'
require-module prelude
require-module connect

plug "andreyorst/smarttab.kak" defer smarttab %{
    # when `backspace' is pressed, 4 spaces are deleted at once
    set-option global softtabstop 4
} config %{
    # these languages will use `expandtab' behavior
    hook global WinSetOption filetype=(python|rust|markdown|kak|lisp|scheme|sh|perl) expandtab
    # these languages will use `noexpandtab' behavior
    hook global WinSetOption filetype=(makefile|gas) noexpandtab
    # these languages will use `smarttab' behavior
    hook global WinSetOption filetype=(c|cpp) smarttab
}

plug "evanrelf/byline.kak" config %{
   require-module "byline"
}

plug "andreyorst/base16-gruvbox.kak" noload do %{
    mkdir -p $HOME/.config/kak/colors
    find $PWD -type f -name "*.kak" -exec ln -sf {} $HOME/.config/kak/colors/ \;
} config %{
    colorscheme base16-gruvbox-dark-medium # or any other variant
}

map global normal <c-u> 'kkkkkkkkkk'
map global normal <c-d> 'jjjjjjjjjj'
map global normal <c-r> 'U'
map global normal <a-p> 'oimport pdb; pdb.set_trace()<esc>'
map global normal <a-P> 'Oimport pdb; pdb.set_trace()<esc>'

map global normal <a-n> 'N'
map global normal N '<a-n>'

# Line numbers
define-command linenums-on %{
  add-highlighter global/ number-lines -hlcursor
  map global normal <c-n> ':linenums-off<ret>'
}
define-command linenums-off %{
  remove-highlighter global/number-lines_-hlcursor
  map global normal <c-n> ':linenums-on<ret>'
}
linenums-on

set-option global scrolloff 99999,3

# Disable mouse
set -add global ui_options ncurses_enable_mouse=0
set -add global ui_options terminal_enable_mouse=false

# Width of a tab
set-option global tabstop 4
# Indent with 4 spaces
set-option global indentwidth 4

# Highlight trailing whitespace
add-highlighter global/ regex \h+$ 0:Error
# Clipboard management mappings
map -docstring "yank the selection into the clipboard" global user y "<a-|> xsel -i<ret>"
map -docstring "paste the clipboard" global user p "<a-!> xsel<ret>"


# IDE

declare-option -docstring 'Width of file picker in percentage of window' str ide_file_picker_width 25
declare-option -docstring 'File picker command' str ide_file_picker "ranger"

define-command ide %{
    connect ide-file-picker %opt{ide_file_picker}
}

define-command ide-file-picker -params 1.. -shell-completion -docstring '
ide-file-picker <program> [<arguments>]: open file picker panel' \
%{
    tmux-terminal-impl "split-window -hb -p %opt{ide_file_picker_width}" %arg{@}
}

hook global BufOpenFile .* editorconfig-load
hook global BufNewFile .* editorconfig-load
