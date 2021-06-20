setopt auto_cd
autoload -U colors && colors

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

PURE_CMD_MAX_EXEC_TIME=10
zstyle :prompt:pure:path color white
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes

prompt pure

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# ZSH Syntax highlighting
source ~/.zsh/zsh-syntax-hi/zsh-syntax-highlighting.zsh 2>/dev/null
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# ALIASES
alias v=nvim
alias ll='ls -alF'

# GIT Aliases
alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m '
alias gp='git push'
alias gpo='git push -u origin'

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/bam/Library/Python/2.7/bin

export CLICOLOR=1
export TERM=xterm-256color
export PATH=$PATH:/Users/bam/bin

# GO STUFF
export GOROOT=/usr/local/go
export GOPATH=/Users/bam/dev/Go
export GOBIN=$(go env GOPATH)/bin
export GO111MODULE=auto
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOBIN
# export PATH=$PATH:$GOPATH/bin
alias gocode="$GOPATH"
alias raly="$HOME/dev/ralydev/raly"

#Subl .
#export EDITOR='subl -w'
export PATH=$PATH:/usr/local/opt/openssl/bin

#TensorFlow
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bam/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bam/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bam/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bam/google-cloud-sdk/completion.zsh.inc'; fi

# Flutter & DART
export PATH=$PATH:/Users/bam/flutter/bin
export PATH=$PATH:/Users/bam/.pub-cache/bin

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

#eval "$(rbenv init -)"

export NODE_PATH=/usr/local/lib/node_modules

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#source /Users/bam/Library/Preferences/org.dystroy.broot/launcher/bash/br

# to set vim mouse scroll
#export TERM=xterm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

PATH="/Users/bam/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/bam/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/bam/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/bam/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/bam/perl5"; export PERL_MM_OPT;
