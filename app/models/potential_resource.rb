# frozen_string_literal: true

# This is a potential resource class
class PotentialResource < ApplicationRecord
  belongs_to :human_resource_manager
  has_many :comments, as: :commentable

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_ALPHA = /\A[^0-9`!@#\$%\^&*+_=]+\z/.freeze

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL }
  validates :name, presence: true, format: { with: VALID_ALPHA }
  validates :last_name, presence: true, format: { with: VALID_ALPHA }
  validates :position, presence: true, format: { with: VALID_ALPHA }
end
