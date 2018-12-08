# frozen_string_literal: true

FactoryBot.define do
  factory :project, class: Project do
    association :project_manager
    name { 'project' }
    resource_reqs { 10 }
    start { Faker::Date.between(2.days.ago, Date.today) }
    finish { Faker::Date.between(Date.today, 2.days.from_now) }
  end
end
