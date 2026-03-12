#!/usr/bin/env zsh
# bootstrap.sh — run this on a fresh machine
# Usage: git clone https://github.com/YOU/dotfiles ~/.dotfiles && ~/.dotfiles/bootstrap.sh

set -euo pipefail

DOTFILES="$HOME/.dotfiles"
echo "==> Starting dotfiles bootstrap from $DOTFILES"

# ─── Homebrew ─────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Apple Silicon path
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

echo "==> Installing Homebrew packages..."
brew bundle install --file="$DOTFILES/Brewfile"

# ─── Symlinks ─────────────────────────────────────────────────────────────────
echo "==> Creating symlinks..."

symlink() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "   linked: $dst → $src"
}

symlink "$DOTFILES/zsh/.zshrc"            "$HOME/.zshrc"
symlink "$DOTFILES/git/.gitconfig"        "$HOME/.gitconfig"
symlink "$DOTFILES/git/.gitignore_global" "$HOME/.gitignore_global"
symlink "$DOTFILES/starship.toml"         "$HOME/.config/starship.toml"
symlink "$DOTFILES/tmux/.tmux.conf"       "$HOME/.tmux.conf"
symlink "$DOTFILES/mise/.mise.toml"       "$HOME/.config/mise/config.toml"

# ─── Shell ────────────────────────────────────────────────────────────────────
BREW_ZSH="$(brew --prefix)/bin/zsh"
if ! grep -qF "$BREW_ZSH" /etc/shells; then
  echo "==> NOTE: Run these manually to set Homebrew zsh as default:"
  echo "   echo '$BREW_ZSH' | sudo tee -a /etc/shells"
  echo "   chsh -s $BREW_ZSH"
elif [[ "$SHELL" != "$BREW_ZSH" ]]; then
  echo "==> Setting Homebrew zsh as default shell..."
  chsh -s "$BREW_ZSH"
fi

# ─── fzf keybindings ──────────────────────────────────────────────────────────
echo "==> Installing fzf shell integration..."
"$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish --no-update-rc

# ─── mise tool versions ───────────────────────────────────────────────────────
echo "==> Installing language runtimes via mise..."
mise install

# ─── Git config reminder ──────────────────────────────────────────────────────
echo ""
echo "==> Done! A few manual steps remaining:"
echo "   1. Update name/email in ~/.gitconfig"
echo "   2. Add your SSH key: ssh-keygen -t ed25519 -C 'you@example.com'"
echo "   3. Add SSH key to GitHub: gh auth login"
echo "   4. Restart your terminal"
