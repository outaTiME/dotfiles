
# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"

# vim: Defaults to Neovim if exists
if command -v nvim 2>&1 >/dev/null; then
  alias vim='nvim'
fi
alias vi='vim'

# yadm: push local dotfiles (re-encrypts sensitive.zsh first) / pull and decrypt on another machine
alias dotpush='yadm encrypt && yadm add -u && yadm commit -m "Update dotfiles" && yadm push'
alias dotpull='yadm pull && yadm decrypt'
