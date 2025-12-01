# Dotfiles

This repository contains my personal Linux configuration files (dotfiles), managed using **GNU Stow** to create symlinks from this repo to `$HOME`.

**Installation:**

```bash
# Clone the repository
git clone https://github.com/moinarshad2004/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install Stow (if not installed)
sudo apt install stow        # Debian/Ubuntu
sudo pacman -S stow          # Arch
sudo dnf install stow        # Fedora

# Stow packages
stow kitty
stow fastfetch

# Or stow everything
stow .
```

**Usage Notes:**

* Edit config files directly in this repository; symlinks ensure changes reflect in `$HOME`.
* To remove symlinks: `stow -D <package_name>`.
* Keep your home directory clean to avoid Stow conflicts.

**Recommended folder structure:**

```
dotfiles/
  zsh/.zshrc
  nvim/.config/nvim/init.lua
  hypr/.config/hypr/hyprland.conf
  kitty/.config/kitty/kitty.conf
```

**License:** Personal configuration files. Feel free to adapt for your setup.

