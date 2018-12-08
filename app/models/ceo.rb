# frozen_string_literal: true

# Models a ceo for the company
class Ceo < ApplicationRecord
  belongs_to :company

  validates :salary, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
end
