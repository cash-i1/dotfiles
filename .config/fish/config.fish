eval "$(/opt/homebrew/bin/brew shellenv)"
fish_add_path "/Users/school/bin"

if status is-interactive
    # binds
    bind tab complete
    bind ctrl-delete kill-word
    bind ctrl-backspace backward-kill-word
    bind ctrl-w backward-kill-word
    bind ctrl-f to

    # vars
    set -x EDITOR nvim
    set -x GTK_CSD 0
    set -x fish_history_limit 0

    # shitty default macos python 
    alias py /opt/homebrew/opt/python@3.13/bin/python3
    
    # path
    set -xa PATH ~/bin
    set -xa PATH ~/scripts/
end
