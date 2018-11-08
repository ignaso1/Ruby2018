#!/usr/bin/env bash

bundle install
#bundle exec mutant --include lib --use rspec Admin Comment CommentRecipient Company Ceo LeaveNotice PotentialResource Project ProjectManager Resource User State
bundle exec rspec
bundle exec rubocop
bundle exec reek

