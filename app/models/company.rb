# frozen_string_literal: true

# This represents the Company
class Company < ApplicationRecord
  belongs_to :admin
  has_one    :ceo
  has_many   :resources, as: :manageable

  validates :name, uniqueness: true,
                   format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :debt, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
