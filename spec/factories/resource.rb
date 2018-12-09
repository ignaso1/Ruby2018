# frozen_string_literal: true

FactoryBot.define do
  factory :valid_resource, class: Resource do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position { 'Developer' }
    salary { rand(0..100) }
    birthday { Date.new(1970, 1, 1).to_s }

    trait(:to_company) { association :manageable, factory: :company }
    trait(:to_project) { association :manageable, factory: :project }

    trait :to_manager do
      association :manageable, factory: :human_resource_manager
    end
  end
end
