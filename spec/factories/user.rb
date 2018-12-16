# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    trait :invalid_name do
      name { 51.times('a') }
    end
    trait(:invalid_last_name) { last_name { 51.times('a') } }
    trait(:invalid_email_format) { email { 'admin$gmail.com' } }
    trait(:invalid_role) { role { 'fake' } }
  end

  factory :invalid_user, class: User do
    email { 'email' }
    password { 'word' }
    password_confirmation { 'ord' }
    name { 'John' }
    last_name { 'Doe' }
    role { 'role' }
  end

  factory :valid_user, class: User do
    email { 'johndoe@example.com' }
    password { 'valid_password' }
    password_confirmation { 'valid_password' }
    name { 'John' }
    last_name { 'Doe' }

    trait(:role_project_manager) { role { 'project_manager' } }
    trait(:role_admin) { role { 'admin' } }
    trait(:role_hr_manager) { role { 'hr_manager' } }
    trait(:role_ceo) { role { 'ceo' } }
  end

  factory :random_user, class: User do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email(name) }
    password { Faker::Internet.password(8, 15, true) }
    role { %w[admin project_manager hr_manager ceo].sample }
  end
end
