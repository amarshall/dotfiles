#!/bin/bash

base_gems_with_doc=(
  bundler
  facets
  paint
  rspec
)

base_gems_without_doc=(
  fruity
  pry
  pry-doc
  pry-theme
)

extra_gems_with_doc=(
  rack
  rails
  sinatra
)

extra_gems_without_doc=(
  lunchy
)

update_rubygems() {
  gem update --system
  gem update
}

cleanup() {
  gem cleanup
}

install_with_doc() {
  gem install "$1"
}

install_without_doc() {
  gem install --no-document --no-ri --no-rdoc "$1"
}

install_base_gems() {
  for gem in "${base_gems_with_doc[@]}"; do install_with_doc "$gem"; done
  for gem in "${base_gems_without_doc[@]}"; do install_without_doc "$gem"; done
}

install_extra_gems() {
  for gem in "${extra_gems_with_doc[@]}"; do install_with_doc "$gem"; done
  for gem in "${extra_gems_without_doc[@]}"; do install_without_doc "$gem"; done
}

set -e
set -x

update_rubygems
install_base_gems
[ "$1" = 'full' ] && install_extra_gems
cleanup
