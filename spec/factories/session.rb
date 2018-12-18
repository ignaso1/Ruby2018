# frozen_string_literal: true

FactoryBot.define do
  factory :valid_session do
    email    { 'johndoe@email.com' }
    password { 'password' }
  end

  factory :invalid_session do
    email    { 'email' }
    password { 'word' }
  end
end
