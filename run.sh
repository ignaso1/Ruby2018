#!/usr/bin/env bash

bundle install
bundle exec mutant --u rspec User ProjectManager Project
bundle exec rspec
bundle exec rubocop
bundle exec reek

