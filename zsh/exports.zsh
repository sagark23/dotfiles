# Editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Path — add custom bins
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# bat (used by fzf preview and as MANPAGER)
export BAT_THEME="Dracula"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Less
export LESS="-R --quit-if-one-screen"

# Node (mise manages versions, but set default flags)
export NODE_OPTIONS="--max-old-space-size=4096"

# Python
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1
