# dotfiles

My configuration files, synced across machines.

## What's included

### Claude Code

Custom status line showing directory, git branch (green = clean, yellow = dirty), and active model:

```
📂 Development/chess-graph  🌿 main  Claude Opus 4.6
```

**File:** [`.claude/settings.json`](.claude/settings.json)

### Zsh

Minimal `.zshrc` with a custom prompt and shared PATH. Machine-specific config (tokens, SDK inits, aliases) goes in `~/.zshrc.local`, which is sourced automatically but not tracked in git.

**File:** [`.zshrc`](.zshrc)

## Setup

Clone and run the install script:

```bash
git clone https://github.com/NicoDeGiacomo/dotfiles.git ~/dotfiles
cd ~/dotfiles && bash install.sh
```

The script creates symlinks from `~` to the files in this repo. Editing a config updates the repo copy — just commit and push.

## Adding new configs

1. Move the config file into this repo
2. Add a symlink line to `install.sh`
3. Commit and push
4. Pull on your other machines and re-run `install.sh`
