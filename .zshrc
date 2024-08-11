# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Theme
ZSH_THEME="gozilla"
DISABLE_LS_COLORS="true"

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# search for any subdir in ~/Developer with a depth of one and cd into it
function dev() {
    local dir=$(find ~/Developer -mindepth 1 -maxdepth 1 -type d | fzf)
    if [ -n "$dir" ]; then
        cd "$dir" 
    fi
}

