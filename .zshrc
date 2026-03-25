# Prompt
PROMPT='%F{cyan}%1~%f %F{magenta}❯%f '

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Completion system
autoload -Uz compinit && compinit

# Machine-specific config (not tracked in git)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
