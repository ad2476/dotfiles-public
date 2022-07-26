_exists() {
  command -v "$1" >/dev/null 2>&1
}

_try_wrap() {
  "$@" >/dev/null 2>&1 || "${@:2}"
}
export NVM_LAZY_LOAD=true

# Sheldon is a shell plugin manager
_exists sheldon && eval "$(sheldon source)"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

autoload -Uz compinit
_try_wrap zsh-defer compinit

# Custom options
unsetopt sharehistory

# Coloured man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fuzzy cd
# Usage: cdf [query]
# fuzzy search pwd for directories with query string
# Set CDF_DIR env var to search a different directory
cdf() {
  local q=${1}
  if [[ -z ${Q} ]]; then
    q="."
  fi
  cd $(fd -t directory ${q} ${CDF_DIR} | fzf)
}

# preview files with fzf
preview() {
  fd -t file $@ | fzf --height 90% --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -100'
}

# preview files with fzf before editing them
# defaults to neovim if EDITOR is unset
edit() {
  local editor=${EDITOR}
  if [[ -z ${editor} ]]; then
    editor="nvim"
  fi
  local output=$(preview $@)
  [[ "${output}" ]] && ${editor} "${output}" || echo "No selection."
}

# Prints the file count per directory for the current directory level
filecount() {
  du -a | cut -d/ -f2 | sort | uniq -c | sort -nr
}

# Rich diffs with bat
batdiff() {
  git diff --name-only --diff-filter=d | xargs bat --diff
}

export PATH=$PATH:$HOME/bin

# fzf default options:
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND="fd ."

# custom SSH command to handle non-standard TERM
# inside of tmux
ssh() {
  local t=${TERM}
  if [[ ${t} = "tmux-256color" ]]; then
    t="screen-256color"
  fi
  TERM=${t} /usr/bin/ssh $@
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Init prompt (https://starship.rs)
_exists starship && eval "$(starship init zsh)"
