#!/usr/bin/env bash

bundle install
bundle exec mutant --u rspec Admin Ceo Comment Company HumanResourceManager LeaveNotice PotentialResource Resource User ProjectManager Project
bundle exec rspec
bundle exec rubocop
bundle exec reek

