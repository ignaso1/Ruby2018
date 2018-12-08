# frozen_string_literal: true

FactoryBot.define do
  factory :company, class: Company do
    association :admin
    name { 'Company' }
    debt { 0 }
  end
end
