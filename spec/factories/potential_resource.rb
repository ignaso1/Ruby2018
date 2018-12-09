# frozen_string_literal: true

FactoryBot.define do
  factory :valid_potential_resource, class: PotentialResource do
    association :human_resource_manager
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position { 'Developer' }
  end
end
