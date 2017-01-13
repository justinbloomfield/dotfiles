if [[ "$EUID" -ne "0" ]]; then
    USER_LEVEL="%F{green}%}" #unroot
else
    USER_LEVEL="%F{magenta}%}" #root
fi

PROMPT="${USER_LEVEL}ê %f"
