
# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"

# vim: Defaults to Neovim if exists
if command -v nvim 2>&1 >/dev/null; then
  alias vim='nvim'
fi
alias vi='vim'
