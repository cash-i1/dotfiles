if status is-interactive
    # binds
    bind tab complete
    bind ctrl-delete kill-word
    bind ctrl-backspace backward-kill-word
    bind ctrl-w backward-kill-word

    # vars
    set -x EDITOR nvim
    set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk
    set -x GTK_CSD 0
    set -x fish_history_limit 0
    set -x NIM_HOME /usr/lib/nim
    set -x NIM_LIB_PATH /usr/lib/nim
    
    # path
    set -xa PATH /home/cash/.cargo/bin
    set -xa PATH ~/bin
    set -xa PATH ~/.nimble/bin/

    # aliases
    alias neovide "neovide --fork"
end
