## Setup
- clone repo into ~/dotfiles
- cd into `~/dotfiles`
- run `stow .` to symlink all folders and files
    - or run `stow <path/to/folder-or-file>` to symlink the desired folder or file
    - Note: `stow -D .` will remove all symlinks

## Prerequisites

### Dotfiles
- install stow `brew install stow`

### Nvim
- install neovim `brew install neovim`
- install ripgrep `brew install ripgrep`

### Kitty
- install kitty `brew install --cask kitty`

### Zsh 
- install oh-my-zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- install fzf `brew install fzf`
- install oh-my-posh `brew install jandedobbeleer/oh-my-posh/oh-my-posh`

### fzf + eza + bat
- `brew install fzf eza bat`

### Aerospace
- install aerospace `brew install --cask aerospace`
- Enable: System Settings > Desktop & Dock > Group windows by application
    - makes mission control work properly

### Font
- install Jetbrains Mono Nerd Font `brew install --cask font-jetbrains-mono-nerd-font`

### Tmux
- install tmux `brew install tmux`
- install tpm
    - install tpm `git clone https://github.com/tmux-plugins/tpm ~/.config/plugins/tpm`
    - press `prefix + I` to install plugins

### Misc
- install lazygit `brew install lazygit`
- install pyenv `brew install pyenv`
    - install python versions `pyenv install 3.9.6`
    - set global python version `pyenv global 3.9.6`
- install raycast `brew install --cask raycast`
    - install karabiner-elements `brew install --cask karabiner-elements`
