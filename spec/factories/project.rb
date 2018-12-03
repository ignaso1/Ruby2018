# frozen_string_literal: true

FactoryBot.define do
  factory :valid_project, class: Project do
    association :project_manager, factory: :valid_pm
    name { 'project' }
    resource_reqs { 10 }
    start { Faker::Date.between(2.days.ago, Date.today) }
    finish { Faker::Date.between(Date.today, 2.days.from_now) }
  end
end