export CLICOLOR=1
export LSCOLORS=ExfxcxdxbxagadbHbHEHEH
export LS_COLORS='di=01;34;49:ln=35;49:so=32;49:pi=33;49:ex=31;49:bd=30;46:cd=30;43:su=31;01;47:sg=31;01;47:tw=01;34;01;47:ow=01;34;01;47'
if [ -z "$JAVA_HOME" ] && command -v /usr/libexec/java_home &> /dev/null; then
  export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
fi
command -v lesspipe.sh &> /dev/null && export LESSOPEN="| lesspipe.sh %s"
[[ -z "$LANG" ]] && export LANG=en_US.UTF-8
[[ -z "$LC_ALL" ]] && export LC_ALL=en_US.UTF-8
export LESS="-i -M -S -R"
export PAGER="$(command -vp less)"

export PATH="$PATH:$HOME/bin"

if [[ "$(uname)" = 'Linux' && "$XDG_SESSION_TYPE" = 'wayland' ]]; then
  # See also lib/bin/sway
  export CLUTTER_BACKEND=wayland
  export MOZ_ENABLE_WAYLAND=1
  export QT_QPA_PLATFORM=wayland-egl
  export SDL_VIDEODRIVER=wayland
  export XDG_CURRENT_DESKTOP=sway
fi
