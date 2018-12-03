# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    trait :invalid_name do
      name { 51.times('a') }
    end

    trait :invalid_email_format do
      email { 'admin$gmail.com' }
    end

    trait :invalid_role do
      role { 'fake' }
    end
  end

  factory :valid_user, class: User do
    email { 'johndoe@example.com' }
    password { 'valid_password' }
    role { 'admin' }
    name { 'John' }
    last_name { 'Doe' }
  end

  factory :random_user, class: User do
    name { Faker.first_name }
    last_name { Faker.last_name }
    email { Faker.Internet.email(name) }
    password { Faker.Internet.password(8, 15, true) }
    role { %w[admin project_manager hr_manager ceo].sample }
  end
end
