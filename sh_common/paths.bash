# For Node/NPM
[[ -d /usr/local/lib/node ]] && export NODE_PATH=/usr/local/lib/node
[[ -d /usr/local/share/npm/bin ]] && export PATH=/usr/local/share/npm/bin:$PATH

# For "home" bin
[[ -d ~/bin ]] && export PATH=$HOME/bin:$PATH

# Load chruby or rbenv or RVM
if [ -s "/usr/local/opt/chruby/share/chruby/chruby.sh" ]; then
  . /usr/local/opt/chruby/share/chruby/chruby.sh
  . /usr/local/opt/chruby/share/chruby/auto.sh
elif type rbenv &> /dev/null; then
  eval "$(rbenv init -)"
elif [ -s "$HOME/.rvm/scripts/rvm" ]; then
  . "$HOME/.rvm/scripts/rvm"
fi
