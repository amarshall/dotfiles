# For MacTeX
[[ -d /Library/TeX/texbin ]] && export PATH=$PATH:/Library/TeX/texbin

# For "home" bin
[[ -d ~/bin ]] && export PATH=$HOME/bin:$PATH

# Load chruby or rbenv or RVM
if [ -s "/usr/local/opt/chruby/share/chruby/chruby.sh" ]; then
  . /usr/local/opt/chruby/share/chruby/chruby.sh
  . /usr/local/opt/chruby/share/chruby/auto.sh
elif command -v rbenv &> /dev/null; then
  eval "$(rbenv init -)"
elif [ -s "$HOME/.rvm/scripts/rvm" ]; then
  . "$HOME/.rvm/scripts/rvm"
fi

# Load nodenv
if command -v nodenv &> /dev/null; then
  eval "$(nodenv init -)"
fi

# For rustup
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

# For Haskell Stack
if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi
