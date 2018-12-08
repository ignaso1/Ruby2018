# frozen_string_literal: true

FactoryBot.define do
  factory :potential_resource, class: PotentialResource do
    association :human_resource_manager
  end
end
