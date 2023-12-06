function init_ls() {
  if command -v exa >/dev/null 2>&1; then
    alias ls='exa --color=auto'
    alias ll='exa --color=auto --long --all --color-scale --extended'
  else
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -alh'
  fi
}
function init_fzf() {
  local EXT=zsh
  local FZF_PATH
  if command -v fzf-share >/dev/null 2>&1; then
    FZF_PATH="$(fzf-share)"
  elif command -v fzf >/dev/null 2>&1; then
    if [ -f /usr/share/fzf/completion.$EXT ]; then
      FZF_PATH=/usr/share/fzf
    elif [ -f /usr/local/share/fzf/completion.$EXT ]; then
      FZF_PATH=/usr/local/share/fzf
    elif [ -f /usr/share/doc/fzf/examples/completion.$EXT ]; then
      FZF_PATH=/usr/share/doc/fzf/examples/
    fi
  fi
  [ -f "$FZF_PATH/completion.$EXT" ] && source "$FZF_PATH/completion.$EXT"
  [ -f "$FZF_PATH/key-bindings.$EXT" ] && source "$FZF_PATH/key-bindings.$EXT"
}
init_ls
init_fzf