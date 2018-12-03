#!/usr/bin/env bash

bundle install
#bundle exec mutant -r ./config/environment --use rspec User
bundle exec rspec
bundle exec rubocop
bundle exec reek

