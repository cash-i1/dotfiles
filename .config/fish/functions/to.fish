function to
    if test (count $argv) -gt 0
        set search_term $argv[1]
        cd $(ls -d /media/chdd2/dev/ /media/chdd2/code/* ~/.dotfiles | fzf --select-1 --query="$search_term")
    else
        cd $(ls -d /media/chdd2/dev/ /media/chdd2/code/* ~/.dotfiles | fzf)
    end
end
