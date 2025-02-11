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

alias grass='/Applications/GRASS-8.4.app/Contents/Resources/bin/grass'

# Add pyenv to PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"

# Initialize pyenv
eval "$(pyenv init --path)"

# NOTE: FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"


export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# search for any subdir in ~/Developer with a depth of one and cd into it
function dev() {
    local dir=$(find ~/Developer -mindepth 1 -maxdepth 1 -type d | fzf)
    if [ -n "$dir" ]; then
        cd "$dir" 
    fi
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Next level of an ls 
# options :  --no-filesize --no-time --no-permissions 
alias l="eza --no-filesize --no-time --color=always --icons=always --no-user --no-permissions"

# Script to list recent files and open nvim using fzf
# set to an alias nlof in .zshrc

list_oldfiles() {
    # Get the oldfiles list from Neovim
    local oldfiles=($(nvim -u NONE --headless +'lua io.write(table.concat(vim.v.oldfiles, "\n") .. "\n")' +qa))
    # Filter invalid paths or files not found
    local valid_files=()
    for file in "${oldfiles[@]}"; do
        if [[ -f "$file" ]]; then
            valid_files+=("$file")
        fi
    done
    # Use fzf to select from valid files
    local files=($(printf "%s\n" "${valid_files[@]}" | \
        grep -v '\[.*' | \
        fzf --multi \
        --preview 'bat -n --color=always --line-range=:500 {} 2>/dev/null || echo "Error previewing file"' \
        --height=70% \
        --layout=default))

  # Open selected files in Neovim and cd to the directory of the file
    if [[ ${#files[@]} -gt 0 ]]; then
        # Get the directory of the first selected file
        local dir=$(dirname "${files[1]}")
        # Change to that directory
        cd "$dir"
        # Open all selected files in Neovim
        nvim "${files[@]}"
    fi
}

alias nv=list_oldfiles
alias a="source ./venv/bin/activate"


