function to
    set paths /media/chdd2/dev/ ~/.dotfiles /media/chdd2/*
    # complete -c to -a $(path)
    if test (count $argv) -gt 0
        set search_term $argv[1]
        set available $(ls -d $paths)

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
        set path (ls -d $paths | fzf)
        if test (count "$path") -gt 0
            cd $path
        end
    end
end
