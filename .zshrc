export TMUX_SHELL="`which zsh`"

if [[ -o interactive && ! -o login && -z "$TMUX" ]]; then
    SHELL=${TMUX_SHELL:-SHELL} tmux a -t workspace || SHELL=${TMUX_SHELL:-SHELL} tmux new -s workspace
fi

fpath=( "$HOME/.zsh/pure" $fpath )
autoload -U promptinit; promptinit
prompt pure

plugins=(zsh-completions)
autoload -U compinit && compinit # for autocompletion

# User configuration

#Run private setup commands
if [ -e ~/.private.rc ]; then
    source ~/.private.rc
fi

# Setup case-insensitive mid-word auto completion
# - fallback to case insensitive if no exact match
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Setup conda for usage - might come from .private.rc
if [ -e "${CONDA_FILE}" ]; then
    . "${CONDA_FILE}"
    export PATH="${CONDA_BIN}:$PATH"
else
    echo -e "\e[31mWARN: Could not find $CONDA_FILE \e[0m"
fi

# Golang root path - Arch specific
export GOROOT=/usr/lib/go

# TODO: Verify authenticity of cuda installation before using
# export PATH="/opt/cuda/bin:$PATH"

# USER DEPENDENT - Set this option only if CUDA is installed on the system
#           Also, specific location depends on OS (this is the one for Arch)
export CUDA_ROOT="/opt/cuda"
export LD_LIBRARY_PATH="/opt/cuda/:$LD_LIBRARY_PATH"
#export THEANORC="~/.theanorc"

# export MANPATH="/usr/local/man:$MANPATH"
# source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Setup readline's vi mode
set -o vi

# Bind ? to reverse history search
# bindkey -M vicmd '?' history-incremental-search-backward

alias zconf="vim ~/.zshrc; source ~/.zshrc"
alias tconf="vim ~/.tmux.conf"
alias l='ls -Flath --color=auto'
alias xopen='xdg-open'

# MSI GS65 specific alias
alias keylight='msi-perkeyrgb -mGS65'

alias curgp='export GOPATH=`pwd`'

# AWS convenience aliases
alias aws-ips="aws ec2 describe-instances | jq -r '.Reservations | .[].Instances | .[] | .PublicIpAddress'"

# Less with color highlighting - Most commands require explicit
# instructions to emit color codes when their output is piped
cless() {
    if [[ "${1}" = ag ]]; then
        "${@}" --color | less -R
    else
        "${@}" --color=always | less -R
    fi
}

if [ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    ZSH_SYNTAX_FILE='/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
else
    ZSH_SYNTAX_FILE='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
fi

# This _has_ to be the last line of the conf file
if [ -e "${ZSH_SYNTAX_FILE}" ]; then
    source "${ZSH_SYNTAX_FILE}"
else
    echo -e "\e[31mWARN: Could not find $ZSH_SYNTAX_FILE \e[0m"
fi
