# dotfiles

Personal dev environment for macOS. One command setup on any new machine.

## Install

```bash
git clone git@github.com:sagark23/dotfiles.git ~/.dotfiles && ~/.dotfiles/bootstrap.sh
```

## What's included

| File | Purpose |
|------|---------|
| `Brewfile` | All packages and apps via Homebrew |
| `zsh/.zshrc` | Shell config — history, completions, tool init |
| `zsh/aliases.zsh` | Shortcuts for git, docker, navigation, eza, bat |
| `zsh/exports.zsh` | Environment variables (PATH, EDITOR, etc.) |
| `zsh/functions.zsh` | Shell functions — mkcd, extract, gfco, fkill, serve |
| `git/.gitconfig` | Git identity, delta diffs, aliases |
| `git/.gitignore_global` | Global gitignore (.DS_Store, .env, keys) |
| `starship.toml` | Minimal single-line prompt |
| `tmux/.tmux.conf` | Tmux config — C-a prefix, vim navigation |
| `mise/.mise.toml` | Default language versions (Node, Python, Java) |

## After bootstrap

Two manual steps required:

```bash
# 1. Set Homebrew zsh as default shell
echo '/opt/homebrew/bin/zsh' | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/zsh

# 2. Update git identity
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Adding new packages

```bash
# Install and add to Brewfile
brew install <package>
brew bundle dump --force --file=~/.dotfiles/Brewfile

# Commit
cd ~/.dotfiles && git add Brewfile && git commit -m "add <package>"
git push
```
