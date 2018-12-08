# frozen_string_literal: true

# This represents the Company
class Company < ApplicationRecord
  belongs_to :admin

  validates :name, uniqueness: true
  validates_format_of :name, with: /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :debt, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :resources
  has_one  :ceo
end
