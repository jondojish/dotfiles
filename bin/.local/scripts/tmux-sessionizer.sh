#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Developer  ~/University ~ -mindepth 1 -maxdepth 2 -type d | awk '!seen[$0]++'| fzf --height=100% )
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
# tmux_running=$(pgrep tmux)
if command -v pgrep &>/dev/null; then
    tmux_running=$(pgrep -f tmux)
else
    tmux_running=$(ps aux | grep -v grep | grep tmux)
fi


if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name

