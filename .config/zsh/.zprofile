export EDITOR="nvim"
export TERMINAL="st"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
