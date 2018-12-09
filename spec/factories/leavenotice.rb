# frozen_string_literal: true

FactoryBot.define do
  factory :valid_leave_notice, class: LeaveNotice do
    association :resource, factory: %I[valid_resource to_project]
    reason { 'Sick' }
    start { Faker::Date.between(2.days.ago, Date.today) }
    finish { Faker::Date.between(Date.today, 4.days.from_now) }
  end
end
