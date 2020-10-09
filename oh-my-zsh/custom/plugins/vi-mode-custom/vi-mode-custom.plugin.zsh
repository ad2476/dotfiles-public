function _set_cursor() {
    if [[ $TMUX = '' ]]; then
      echo -ne $1
    else
      echo -ne "\ePtmux;\e\e$1\e\\"
    fi
}
function _set_block_cursor() { _set_cursor '\e[2 q' }
function _set_line_cursor() { _set_cursor '\e[5 q' }
function _set_under_cursor() { _set_cursor '\e[4 q' }
precmd_functions+=(_set_block_cursor)  # ensure beam cursor in new terminal

# Updates editor information when the keymap changes.
VI_KEYMAP="main"
function zle-keymap-select() {
  # update keymap variable for the prompt
  VI_KEYMAP=$KEYMAP

  if [[ ${KEYMAP} == vicmd ]]; then
    _set_under_cursor
  else
    _set_block_cursor
  fi

  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi-accept-line() {
  VI_KEYMAP=main
  _set_block_cursor
  zle accept-line
}

zle -N vi-accept-line

bindkey -v

# use custom accept-line widget to update $VI_KEYMAP
bindkey -M vicmd '^J' vi-accept-line
bindkey -M vicmd '^M' vi-accept-line

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^u' backward-kill-line

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  #MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
  MODE_INDICATOR="%{$fg_bold[red]%}[-N-]%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

if [[ "$CMD_COLOUR" == "" ]]; then
  CMD_COLOUR="%{$bg[red]%}"
fi

function vi_mode_prompt_colour() {
  INS_COLOUR="%{$reset_color%}"
  echo "${${VI_KEYMAP/vicmd/$CMD_COLOUR}/(main|viins)/$INS_COLOUR}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
