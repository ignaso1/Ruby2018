# frozen_string_literal: true

FactoryBot.define do
  factory :project_manager, class: ProjectManager,
                            parent: :valid_user,
                            traits: [:role_project_manager] do
  end
end
