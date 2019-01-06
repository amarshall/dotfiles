function __git_prompt() {
  local g="$(git rev-parse --git-dir 2>/dev/null)"
  if [ -n "$g" ]; then
    local r
    local b
    if [ -d "$g/../.dotest" ]
    then
      if test -f "$g/../.dotest/rebasing"
      then
        r="|REBASE"
      elif test -f "$g/../.dotest/applying"
      then
        r="|AM"
      else
        r="|AM/REBASE"
      fi
      b="$(git symbolic-ref HEAD 2>/dev/null)"
    elif [ -f "$g/.dotest-merge/interactive" ]
    then
      r="|REBASE-i"
      b="$(cat "$g/.dotest-merge/head-name")"
    elif [ -d "$g/.dotest-merge" ]
    then
      r="|REBASE-m"
      b="$(cat "$g/.dotest-merge/head-name")"
    elif [ -f "$g/MERGE_HEAD" ]
    then
      r="|MERGING"
      b="$(git symbolic-ref HEAD 2>/dev/null)"
    else
      if [ -f "$g/BISECT_LOG" ]
      then
        r="|BISECTING"
      fi
      if ! b="$(git symbolic-ref HEAD 2>/dev/null)"
      then
        if ! b="tag: $(git describe --exact-match --tags HEAD 2>/dev/null)"
        then
          b="$(cut -c1-7 "$g/HEAD")..."
        fi
      fi
    fi

    if [ -n "$1" ]; then
      printf "$1" "${b##refs/heads/}$r"
    else
      printf "[%s]" "${b##refs/heads/}$r"
    fi
  fi
}

function __shorten_path() {
  local fullpath=${1}
  local maxlen=$2  # Note that maxlen will not be strictly adhered to since the
                   # last dir in the path will never be shortened.

  local len=${#fullpath}
  local parts
  local result

  fullpath=$(echo $fullpath | sed "s@^$HOME@~@")

  if [ $len -gt $maxlen ]; then
    parts=("${(s@/@)fullpath}")

    for i in {1..$(((${#parts[@]} - 1)))}; do
      if [ $len -le $maxlen ]; then break; fi
      local part=$parts[$i]
      len=$((($len - ${#part})))
      parts[$i]=$part[0,1]
    done

    IFS='/' result=${parts[*]}
  else
    result=$fullpath
  fi

  echo $result
}

function __prompt() {
  local colon
  local git
  local hostname
  local curpath
  local username
  local color_dir='%{%F{cyan}%}'
  local color_git='%{%b%F{yellow}%}'
  local color_none='%{%b%f%}'
  local color_prompt='%{%B%F{red}%}'
  local color_user_host='%{%F{magenta}%}'
  local maxpathlen=40  # max length of curpath (in characters)
  local usernames="${DOTFILES_USERNAMES:-amarshall,andrew.marshall}"

  echo "$usernames" | grep --extended-regexp --quiet "(^|,)$USERNAME(,|$)" || username='%n'  # Don't display user if it's my own
  [[ -n $SSH_CONNECTION ]] && hostname=$hostname'@%m'  # If running locally, we probably know what machine it is
                                                       #   always display "@" so host is not mistaken for username
  ([ -n "$username" ] || [ -n "$hostname" ]) && colon=':'  # Don't separate if nothing to separate
  [[ $HOME != $(pwd) ]] && curpath=$(__shorten_path "$(pwd)" $maxpathlen)  # Don't display the path if we're home
  git=$(__git_prompt)  # Display information about current git repo

  case "$1" in
    prompt)
      printf "%s" $color_user_host$username$hostname $color_none$colon $color_dir$curpath $color_git$git $color_prompt'%(!.#.｠)'$color_none' '
      ;;
    title)
      print -Pn "\e]0;" $username$hostname$colon "%~\a"
      ;;
  esac
}

function __precmd_title() {
  __prompt title
}

precmd_functions=(__precmd_title $precmd_functions)
PROMPT='$(__prompt prompt)'
