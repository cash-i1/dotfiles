if status is-interactive
    # Commands to run in interactive sessions can go here
    bind \c\t nextd-or-forward-word
    bind \t complete

    alias cdcode "cd /media/chdd2/code"
    alias cdpy "cd /media/chdd2/code/python"
    alias cdrust "cd /media/chdd2/code/rust"
    alias cdcpp "cd /media/chdd2/code/cpp"
    alias cdweb "cd /media/chdd2/code/web"

    set -x PATH /home/cash/.cargo/bin $PATH
    set -x PATH ~/.local/bin/ $PATH
    set -x PATH /usr/lib/jvm/java-21-openjdk/bin/ $PATH
    # set -x PATH /home/cash/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer $PATH
    set -x EDITOR code
    
    alias edit $EDITOR
end
