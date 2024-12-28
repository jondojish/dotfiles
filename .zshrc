# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/ohmyposh.json)"
fi

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# kitty ssh fix
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"

# search for any subdir in ~/Developer with a depth of one and cd into it
function dev() {
    local dir=$(find ~/Developer -mindepth 1 -maxdepth 1 -type d | fzf)
    if [ -n "$dir" ]; then
        cd "$dir" 
    fi
}


alias grass='/Applications/GRASS-8.4.app/Contents/Resources/bin/grass'

# Add pyenv to PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"

# Initialize pyenv
eval "$(pyenv init --path)"

