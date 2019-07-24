source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle akoenig/gulp-autocompletion-zsh
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle sublime
antigen bundle yarn
antigen bundle common-aliases

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

# Tell Antigen that you're done.
antigen apply

# Path
# export PATH="$HOME/.yarn/bin:`yarn global bin`:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/Applications/Genymotion.app/Contents/MacOS/tools:$HOME/.fastlane/bin:$PATH"

# Aliases
if [ -f ~/.zsh/aliases.zsh ]; then
  source ~/.zsh/aliases.zsh
fi

# Sensitive data
if [ -f ~/.zsh/sensitive.zsh ]; then
  source ~/.zsh/sensitive.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_TMUX=1
# export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!{.git,node_modules,bower_components,build,.tmp,dist,package-lock.json,yarn.lock}'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# onedark
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=dark
#   --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
#   --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
# '
# dracula
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color fg:255,bg:236,hl:84,fg+:255,bg+:236,hl+:215
#   --color info:141,prompt:84,spinner:212,pointer:212,marker:212
# '
