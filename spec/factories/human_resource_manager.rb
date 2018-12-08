# frozen_string_literal: true

FactoryBot.define do
  factory :human_resource_manager, class: HumanResourceManager,
                                   parent: :valid_user,
                                   traits: [:role_hr_manager] do
  end
end
