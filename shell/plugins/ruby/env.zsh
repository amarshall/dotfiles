if [ -s "/usr/local/opt/chruby/share/chruby/chruby.sh" ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
elif command -v rbenv &> /dev/null; then
  eval "$(rbenv init -)"
elif [ -s "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
fi
