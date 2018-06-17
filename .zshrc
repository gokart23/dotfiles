# export ZSH=$HOME/.oh-my-zsh
if [[ -o interactive && ! -o login && -z "$TMUX" ]]; then
    tmux a -t workspace || tmux new -s workspace
fi

autoload -U promptinit; promptinit
prompt pure

plugins=(zsh-completions)
autoload -U compinit && compinit

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# Setup conda for usage
. ~/Programs/miniconda3/etc/profile.d/conda.sh

# TODO: Verify authenticity of cuda installation before using
# export PATH="/opt/cuda/bin:$PATH"

# USER DEPENDENT - Set this option only if CUDA is installed on the system
#           Also, specific location depends on OS (this is the one for Arch)
export CUDA_ROOT="/opt/cuda"
export LD_LIBRARY_PATH="/opt/cuda/:$LD_LIBRARY_PATH"
export PYTHONPATH="$PYTHONPATH:/usr/local/share/opencog/python"
#export THEANORC="~/.theanorc"

#Run private setup commands
source ~/.private.rc

# export MANPATH="/usr/local/man:$MANPATH"
# source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

# This _has_ to be the last line of the conf file
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
