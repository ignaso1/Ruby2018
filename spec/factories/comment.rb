# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: Comment do
    trait(:to_project) { association :commentable, factory: :project }

    trait :to_resource do
      association :commentable, factory: %I[valid_resource to_project]
    end

    trait :to_potential_resource do
      association :commentable, factory: :potential_resource
    end
  end
end
