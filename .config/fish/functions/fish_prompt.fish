function fish_prompt
    # so python venv doesn't break the prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    if test -n "$VIRTUAL_ENV"
        echo -n "("(set_color blue)(basename $VIRTUAL_ENV)(set_color normal)") "
    end

    echo -n (set_color yellow)$USER
    echo -n (set_color red)'@'
    echo -n (set_color magenta)(prompt_hostname)
    echo -n " "
    echo -n (set_color green)(prompt_pwd)
    echo -n (set_color white)'$ '

    set_color normal
end
