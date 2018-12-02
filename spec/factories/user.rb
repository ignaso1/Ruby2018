FactoryBot.define do
  factory :user, class :User do
  end

  factory :valid_user, class: User do
    email { 'johndoe@example.com' }
    password_digest { 'password' }
    role_type { '' }
    name { 'John' }
    last_name { 'Doe' }
  end

  factory :random_user, class: User do
    name { Faker.first_name }
    last_name { Faker.last_name }
    email { Faker.Internet.email(name) }
    password_digest { Faker.Internet.password(8, 15, true) }
    role_type { ['admin', 'project_manager', 'hr_manager', 'ceo'].sample }
  end
end
