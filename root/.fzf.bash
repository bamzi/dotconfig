# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/bam/.config/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/bam/.config/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/bam/.config/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/bam/.config/fzf/shell/key-bindings.bash"
