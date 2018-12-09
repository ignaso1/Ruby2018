# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: Comment do
    content  { 'This is a comment' }
    author   { 'Author' }
    creation { Date.new(1970, 1, 1).to_s }

    trait(:to_project) { association :commentable, factory: :project }

    trait :to_resource do
      association :commentable, factory: %I[valid_resource to_project]
    end

    trait :to_potential_resource do
      association :commentable, factory: :potential_resource
    end
  end
end
