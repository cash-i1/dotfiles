if [[ "$(setxkbmap -query | grep variant | sed 's/variant://' | tr -d ' ')" == "" ]]; then
    if [[ "$(setxkbmap -query | grep layout | sed 's/layout://' | tr -d ' ')" == "us" ]]; then
        echo "you are us layout. changing to colemak"
        notify-send "layout: us colemak"
        setxkbmap us -variant colemak
    fi
else
    if [[ "$(setxkbmap -query | grep variant | sed 's/variant://' | tr -d ' ')" == "colemak" ]]; then
        echo "you are us colemak layout. changing to us layout"
        notify-send "layout: us qwerty"
        setxkbmap us
    fi
fi

