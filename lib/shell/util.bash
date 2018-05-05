#!/bin/bash

# Takes as args either:
#
#   none
#   bold
#   underline
#   fg <color>
#   bg <color>
term_format() {
  case "$1" in
    reset) tput sgr0 ;;
    bold) tput bold ;;
    underline) tput underline ;;
    fg)
      case "$2" in
        red) tput setaf 1 ;;
        green) tput setaf 2 ;;
        yellow) tput setaf 3 ;;
        blue) tput setaf 4 ;;
        magenta) tput setaf 5 ;;
        cyan) tput setaf 6 ;;
        white) tput setaf 7 ;;
        *)
          printf "unknown color" >&2
          return 1
      esac
      ;;
    bg)
      case "$2" in
        red) tput setab 1 ;;
        green) tput setab 2 ;;
        yellow) tput setab 3 ;;
        blue) tput setab 4 ;;
        magenta) tput setab 5 ;;
        cyan) tput setab 6 ;;
        white) tput setab 7 ;;
        *)
          printf "unknown color" >&2
          return 1
      esac
      ;;
    *)
      printf "unknown type" >&2
      return 1
  esac
}

# Intended as a controlled version of `set -x`, echos the command, then
# executes it.
runcmd() {
  echo + "$@" >&2
  if [[ -z "$DRY_RUN" ]]; then
    (set +e ; "$@")
    return $?
  else
    return 0
  fi
}

# Like `&&`, but without short-circuiting. Returns 1 if any commands exit with
# non-zero status. Does *not* use `runcmd` for running commands.
runmulti() {
  local exit_status=0
  for cmd in "$@"; do
    if [[ -z "$DRY_RUN" ]]; then
      $cmd || exit_status=1
    fi
  done
  return $exit_status
}

# Like `runcmd`, except exec the command.
execcmd() {
  echo + "$@" >&2
  if [[ -z "$DRY_RUN" ]]; then
    exec "$@"
  else
    exit
  fi
}

# Returns success if STDOUT is a terminal, failure if not.
output_is_terminal() {
  if [ -t 1 ]; then
    return 0
  else
    return 1
  fi
}

# Accepts a prefix, ANSI-control format string, and message. Primarily meant for
# building other output functions.
message() {
  local prefix="$1"
  local ansi_format="$2"
  local message=''
  if [[ -z "$3" ]]; then
    read -r -d '' message
  else
    message="$3"
  fi
  local padding="$(echo "$prefix" | perl -pe 's/./ /g')"
  message="$(echo "$message" | perl -pe "s/^/$padding/ unless 1")"
  printf "%b%s %s%b\\n" "$ansi_format" "$prefix" "$message" "$FMT_NONE" >&2
}

# Accepts a message either via stdin or as the first argument. Does not exit.
info() {
  message '==>' "$FMT_BOLD" "$@"
}

# Accepts a message either via stdin or as the first argument. Does not exit.
warn() {
  message 'WARNING:' "$FMT_YELLOW" "$@"
}

# Accepts a message either via stdin or as the first argument. Does not exit.
fatal() {
  message 'FATAL:' "$FMT_RED" "$@"
}

# Like `fatal`, but also exits with non-zero status.
abort() {
  fatal "$1"
  exit 1
}

# Indents the given text (via stdin). Defaults to two spaces, takes optional
# argument for number of spaces to indent by.
indent() {
  local num=${1:-2}
  local str="$(printf "%${num}s" '')"
  perl -pe "s/^/$str/"
}

# Removes all ANSI colors codes, takes input via stdin.
remove_color_codes() {
  perl -pe 's/\x1b\[[0-9;]*m//g'
}

# Changes "light black" colors so they are not hidden with Solarized Dark.
# If stdout is not a terminal, it will remove all color codes.
#
# Note that, as is true with all shell pipelines, this cannot return the exit
# status of the piped-from command. See instead unblacken_cmd().
#
# See <https://github.com/altercation/solarized/pull/240>
# See <https://github.com/mochajs/mocha/issues/802#issuecomment-18254298>
unblacken() {
  if output_is_terminal; then
    perl -pe 's/\x1b\[90m/\x1b[92m/g'
  else
    remove_color_codes
  fi
}

# Like `unblacken`, but takes the command to unblacken as an argument list and
# returns the exit status of the command run.
unblacken_cmd() {
  set -o pipefail
  "$@" | unblacken
}
