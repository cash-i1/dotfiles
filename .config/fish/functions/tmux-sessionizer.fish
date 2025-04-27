#!/usr/bin/env bash

set paths /media/chdd2/dev/_test/ /media/chdd2/dev/_misc/ /media/chdd2/dev/ /media/chdd2/code/*/

if test (count $arg) = 1
    set selected $1
else
    set selected (find $paths -mindepth 1 -maxdepth 1 -type d | fzf)
    # set selected (find /tmp -mindepth 1 -maxdepth 1 -type d | fzf)
end

if test -z $selected 
    exit 0
end

set selected_name (basename "$selected" | tr . _)
set tmux_running (pgrep tmux)

if test -z $TMUX; and test -z $tmux_running
    tmux new-session -s $selected_name -c $selected
    exit 0
end

if not tmux has-session -t=$selected_name 2> /dev/null
    tmux new-session -ds $selected_name -c $selected
end

tmux switch-client -t $selected_name
