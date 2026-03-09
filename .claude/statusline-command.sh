#!/bin/bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
parent=$(basename "$(dirname "$cwd")")
current=$(basename "$cwd")
dir="$parent/$current"

cd "$cwd" 2>/dev/null || exit 1

if git rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git -c core.useBuiltinFSMonitor=false rev-parse --abbrev-ref HEAD 2>/dev/null)

    if git -c core.useBuiltinFSMonitor=false diff-index --quiet HEAD -- 2>/dev/null; then
        branch_color="\033[32m"
    else
        branch_color="\033[33m"
    fi

    git_dir=$(git rev-parse --git-dir 2>/dev/null)
    git_common=$(git rev-parse --git-common-dir 2>/dev/null)

    if [ "$git_dir" != "$git_common" ]; then
        wt_name=$(basename "$cwd")
        printf "\033[35m[wt: %s]\033[0m  ${branch_color} %s\033[0m  \033[36m%s\033[0m" "$wt_name" "$branch" "$model"
    else
        printf "📂 %s  🌿 ${branch_color}%s\033[0m  \033[36m%s\033[0m" "$dir" "$branch" "$model"
    fi
else
    printf "📂 %s  \033[36m%s\033[0m" "$dir" "$model"
fi
