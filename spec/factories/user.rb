# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    trait :invalid_name do
      name { 51.times('a') }
    end

    trait(:invalid_email_format) { email { 'admin$gmail.com' } }
    trait(:invalid_role) { role { 'fake' } }
  end

  factory :valid_user, class: User do
    email { 'johndoe@example.com' }
    password { 'valid_password' }
    name { 'John' }
    last_name { 'Doe' }

    trait(:project_manager) { role { 'project_manager' } }
    trait(:admin) { role { 'admin' } }
    trait(:hr_manager) { role { 'hr_manager' } }
    trait(:ceo) { role { 'ceo' } }
  end

  factory :random_user, class: User do
    name { Faker.first_name }
    last_name { Faker.last_name }
    email { Faker.Internet.email(name) }
    password { Faker.Internet.password(8, 15, true) }
    role { %w[admin project_manager hr_manager ceo].sample }
  end
end
