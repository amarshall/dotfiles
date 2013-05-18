#!/bin/bash

gems_with_doc=(
  bundler
  facets
  mongoid
  paint
  rack
  rails
  rspec
  sinatra
)

gems_without_doc=(
  fruity
  lunchy
  pry
  pry-debugger
  pry-doc
  pry-rescue
  pry-theme
)

gem update --system
gem update
gem install gems_with_doc
gem install --no-document gems_without_doc
gem cleanup
