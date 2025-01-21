eval "$(/opt/homebrew/bin/brew shellenv)"
fish_add_path "/Users/school/bin"

if status is-interactive
    bind \c\t nextd-or-forward-word
    bind \t complete

    # ctrl-backspace and ctrl-del
    bind \e\[3\;5~ 'kill-word'
    bind \cH 'backward-kill-word'

    set -x PATH /home/cash/.cargo/bin $PATH
    set -x EDITOR nvim
    set -x GTK_CSD 0
    set -x fish_history_limit 0
    
    alias edit $EDITOR
end
