#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Claude Code
mkdir -p ~/.claude
ln -sf "$DOTFILES_DIR/.claude/settings.json" ~/.claude/settings.json
echo "  Linked .claude/settings.json"
ln -sf "$DOTFILES_DIR/.claude/statusline-command.sh" ~/.claude/statusline-command.sh
echo "  Linked .claude/statusline-command.sh"
ln -sf "$DOTFILES_DIR/claude-global-CLAUDE.md" ~/.claude/CLAUDE.md
echo "  Linked .claude/CLAUDE.md (global)"

# Zsh
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
echo "  Linked .zshrc"

# Git
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
echo "  Linked .gitconfig"

if [ ! -f ~/.gitconfig-work ]; then
  echo ""
  read -p "  Work git name: " work_name
  read -p "  Work git email: " work_email
  cat > ~/.gitconfig-work <<EOF
[user]
	name = $work_name
	email = $work_email
EOF
  echo "  Created .gitconfig-work"
else
  echo "  .gitconfig-work already exists, skipping"
fi

# Claude Code Skills
echo ""
echo "Installing Claude Code skills..."
while IFS= read -r line || [ -n "$line" ]; do
  [[ -z "$line" || "$line" == \#* ]] && continue
  echo "  Installing: $line"
  npx skills add $line -g -a claude-code -y
done < "$DOTFILES_DIR/.claude/skills.txt"
echo "  Done installing skills"

echo "Done."
