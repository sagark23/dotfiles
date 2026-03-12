# mkcd — make dir and cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# Extract any archive
extract() {
  case "$1" in
    *.tar.gz|*.tgz)   tar xzf "$1"   ;;
    *.tar.bz2|*.tbz2) tar xjf "$1"   ;;
    *.tar.xz)          tar xJf "$1"   ;;
    *.tar)             tar xf "$1"    ;;
    *.zip)             unzip "$1"     ;;
    *.gz)              gunzip "$1"    ;;
    *.bz2)             bunzip2 "$1"   ;;
    *.rar)             unrar x "$1"   ;;
    *.7z)              7z x "$1"      ;;
    *) echo "'$1' cannot be extracted" ;;
  esac
}

# fzf-powered branch switcher
gfco() {
  local branch
  branch=$(git branch -a | fzf --preview 'git log --oneline --color=always {1}' | sed 's/remotes\/origin\///' | tr -d ' ')
  [ -n "$branch" ] && git checkout "$branch"
}

# fzf-powered process kill
fkill() {
  local pid
  pid=$(ps aux | fzf --header '[kill process]' | awk '{print $2}')
  [ -n "$pid" ] && kill -9 "$pid" && echo "Killed $pid"
}

# Quick HTTP server in current dir
serve() { python3 -m http.server "${1:-8000}"; }

# Show top 10 most used shell commands
topcmds() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
}

# cd to git root
groot() { cd "$(git rev-parse --show-toplevel)"; }

# Create a .envrc with a blank template and allow it
mkenv() {
  cat > .envrc <<'EOF'
# Environment variables for this project
# export API_KEY=""
EOF
  direnv allow .
}
