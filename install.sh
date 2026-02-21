#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Claude Code
mkdir -p ~/.claude
ln -sf "$DOTFILES_DIR/.claude/settings.json" ~/.claude/settings.json
echo "  Linked .claude/settings.json"
ln -sf "$DOTFILES_DIR/.claude/CLAUDE.md" ~/.claude/CLAUDE.md
echo "  Linked .claude/CLAUDE.md"

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

echo "Done."
