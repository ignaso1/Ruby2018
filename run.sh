#!/usr/bin/env bash

bundle install
bundle exec mutant --include lib --use rspec Admin Comment Company LeaveNotice PotentialResource Project ProjectManager Resource User
bundle exec rspec
bundle exec rubocop
bundle exec reek

