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

    alias ts tmux-sessionizer

    set -xa PATH ~/bin
    set -xa PATH ~/.nimble/bin/
    set -x NIM_HOME /usr/lib/nim
    set -x NIM_LIB_PATH /usr/lib/nim

    # shitty default macos python 
    alias py /opt/homebrew/opt/python@3.13/bin/python3
end
