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

### Aerospace
- install aerospace `brew install --cask aerospace`
- Enable: System Settings > Desktop & Dock > Group windows by application
    - makes mission control work properly

### Font
- install [Jetbrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases)
