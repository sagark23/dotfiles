# ─── Navigation ───────────────────────────────────────────────────────────────
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

# ─── ls → eza ─────────────────────────────────────────────────────────────────
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first --git"
alias lt="eza --tree --icons --level=2"
alias lta="eza --tree --icons --level=3 --all"

# ─── cat → bat ────────────────────────────────────────────────────────────────
alias cat="bat --paging=never"
alias cath="bat"     # bat with paging (h for 'human readable scroll')

# ─── Git ──────────────────────────────────────────────────────────────────────
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log --oneline --graph --decorate --all"
alias gst="git stash"
alias gstp="git stash pop"

# ─── Docker ───────────────────────────────────────────────────────────────────
alias dk="docker"
alias dkc="docker compose"
alias dkps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"

# ─── Misc ─────────────────────────────────────────────────────────────────────
alias reload="source ~/.zshrc"
alias path='echo $PATH | tr ":" "\n"'
alias myip="curl -s https://api.ipify.org && echo"
alias ports="lsof -iTCP -sTCP:LISTEN -n -P"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias brewup="brew update && brew upgrade && brew cleanup"
alias dotfiles="cd ~/.dotfiles"
