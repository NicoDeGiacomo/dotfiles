# Global Claude Code Guidelines

## Git
- Do not add Co-Authored-By lines to commits. Commit only under the user's name.

## Validation After Code Changes
- After making code changes, run the project's compile, build, lint, and test steps. The specific commands depend on the project's stack (e.g., `go build`/`go vet`/`golangci-lint run`/`go test`, `npm run build`/`npm run lint`/`npm test`, etc.).
- Treat warnings as errors — fix all warnings before considering the task complete.
- If any step fails, fix the issue before moving on.

## Claude Code Skills
- When installing a global skill, always do both steps:
  1. Run the install command: `npx skills add <args> -g -a claude-code -y`
  2. Add a line to `~/dotfiles/.claude/skills.txt` with the arguments (e.g., `some-org/skill-name --all`)
- This ensures skills are synced across machines via `install.sh`.

## File Names
- File names are case-sensitive. Always use exact casing (e.g., MORNING.md, GUARDIAN.md, CLAUDE.md). If a file isn't found, try different casings before asking the user.
