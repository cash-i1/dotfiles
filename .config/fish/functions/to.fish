function to
    if test (count $argv) -gt 0
        set search_term $argv[1]
        set available $(ls -d /media/chdd2/dev/ /media/chdd2/code/* ~/.dotfiles)

        # see if selection is EMPTY
        if test -z "$available"
            exit
        end
        
        set selection $(printf "%s\n" $available | fzf --select-1 --exit-0 --query="$search_term")

        # see if selection is NOT EMPTY
        if test -n "$selection"
            cd $selection
        end
    else
        cd $(ls -d /media/chdd2/dev/ /media/chdd2/code/* ~/.dotfiles | fzf)
    end
end
