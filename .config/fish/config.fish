if status is-interactive
    # Commands to run in interactive sessions can go here
    bind \c\t nextd-or-forward-word
    bind \t complete

    # ctrl-backspace and ctrl-del
    bind \e\[3\;5~ 'kill-word'
    bind \cH 'backward-kill-word'

    alias cdcode "cd /media/chdd2/code"
    alias cdpy "cd /media/chdd2/code/python"
    alias cdrust "cd /media/chdd2/code/rust"
    alias cdcpp "cd /media/chdd2/code/cpp"
    alias cdweb "cd /media/chdd2/code/web"

    set -x PATH /home/cash/.cargo/bin $PATH
    set -x PATH ~/.local/bin/ $PATH
    set -x PATH /usr/lib/jvm/java-21-openjdk/bin/ $PATH
    # set -x PATH /home/cash/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer $PATH
    set -x EDITOR nvim
    # set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk/bin/java
    set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk
    set -x GTK_CSD 0
    set -x fish_history_limit 0
    
    alias edit $EDITOR

    alias ts tmux-sessionizer

    set -xa PATH ~/bin
    set -xa PATH ~/.nimble/bin/
    set -x NIM_HOME /usr/lib/nim
    set -x NIM_LIB_PATH /usr/lib/nim
end
