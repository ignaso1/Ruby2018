# frozen_string_literal: true

FactoryBot.define do
  factory :resource, class: Resource do
    association :project, factory: :valid_project
    association :company, factory: :company
  end

  factory :valid_resource, class: Resource do
    association :project, factory: :valid_project
    association :company, factory: :company

    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position { 'Developer' }
    salary { rand(0..100) }
    birthday { '1970-01-01' }
  end
end
