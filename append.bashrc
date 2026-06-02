
# append.bashrc
export PS1='\[\033[00m\]\w \[\033[00;31m\]♾\[\033[00m\] '

set -o vi
export VISUAL=hx

stty -ixon

alias pytree="tree -I '__pycache__'"

function gic { git commit -m "$*"; }

# Auto-name zellij tabs after the running command (tmux-style
# #{pane_current_command}). When idle the tab shows the current directory.
# Only active inside a zellij session; a no-op everywhere else.
if [[ -n "$ZELLIJ" ]] && command -v zellij >/dev/null 2>&1; then
  # Before each command runs: rename the tab to that command's name.
  # Skip while the prompt redraws (BASH_COMMAND is PROMPT_COMMAND then).
  _zellij_tab_cmd() {
    [[ -n "$COMP_LINE" ]] && return            # ignore completion
    [[ "$BASH_COMMAND" == "$PROMPT_COMMAND" ]] && return
    local cmd="${BASH_COMMAND%% *}"            # first word
    cmd="${cmd##*/}"                           # strip path
    [[ -n "$cmd" ]] && zellij action rename-tab "$cmd" 2>/dev/null
  }
  trap '_zellij_tab_cmd' DEBUG

  # When the command finishes (next prompt): reset tab to the cwd basename.
  _zellij_tab_dir() {
    local dir="${PWD##*/}"
    [[ "$PWD" == "$HOME" ]] && dir="~"
    zellij action rename-tab "${dir:-/}" 2>/dev/null
  }
  PROMPT_COMMAND="_zellij_tab_dir${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
fi
