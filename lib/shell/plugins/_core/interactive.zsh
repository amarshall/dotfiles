alias be='bundle exec'
alias cmdstatistics="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias cp='cp -i'
alias git-root='cd $(git root)'
alias gzdir='tar czf ../$(basename "$(pwd)").tar.gz .'
alias gzdirs='find . -mindepth 1 -maxdepth 1 -type d -exec tar czf {}.tar.gz {} \;'
alias httpheaders='curl -I'
alias less='less -R -i'
alias ll='ls -l'
if [[ "$(uname)" = Linux ]]; then
  alias ls='ls -aFh --group-directories-first'
else
  alias ls='ls -aFh'
fi
alias mv='mv -i'
alias mvimload='mvim -c "so %"'
alias parallel='parallel --will-cite'
alias prd='pwd -P'  # "print real directory" (follows symlinks)
alias R='R --no-save --quiet'
alias ri='ri -f ansi'
alias vimload='vim -c "so %"'

command -v apt-get &> /dev/null && alias aptupgrade='sudo apt-get update && sudo apt-get upgrade'
command -v colordiff &> /dev/null && alias diff=colordiff
command -v colormake &> /dev/null && alias make=colormake
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
command -v open &> /dev/null && alias o='open'

if command -v exa &> /dev/null; then
  alias lx='exa --all --classify --git --group-directories-first --time-style=long-iso'
  alias lxl='exa --all --classify --git --group-directories-first --time-style=long-iso --long'
fi

if command -v nvim &> /dev/null; then
  alias view='nvim -R'
fi

if command -v qlmanage &> /dev/null; then
  alias ql='quicklook'
  alias quicklook='qlmanage -p &> /dev/null'
fi

if type /System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine &> /dev/null; then
  alias screensaver=/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine
fi

if command -v dircolors &> /dev/null; then
  if alias ls &> /dev/null; then
    ls=$(alias ls | awk -F"'" '{print $(NF-1)}')
    alias ls="$ls --color=auto"
    unset ls
  else
    alias ls='ls --color=auto'
  fi
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
fi
