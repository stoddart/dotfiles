# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/daniel/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/daniel/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/daniel/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/daniel/.fzf/shell/key-bindings.bash"
