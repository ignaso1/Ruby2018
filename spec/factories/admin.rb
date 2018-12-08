# frozen_string_literal: true

FactoryBot.define do
  factory :admin, class: Admin,
                  parent: :valid_user,
                  traits: [:role_admin] do
  end
end
