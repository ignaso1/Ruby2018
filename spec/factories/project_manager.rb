# frozen_string_literal: true

FactoryBot.define do
  factory :valid_pm, class: ProjectManager,
                     parent: :valid_user,
                     traits: [:role_project_manager] do
  end
end
