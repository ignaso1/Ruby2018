# frozen_string_literal: true

# Models a human resource
class Resource < ApplicationRecord
  belongs_to :manageable, polymorphic: true

  has_many   :comments, as: :commentable
  has_many   :leave_notices

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_ALPHA = /\A[^0-9`!@#\$%\^&*+_=]+\z/.freeze

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL }
  validates :name, presence: true, format: { with: VALID_ALPHA }
  validates :last_name, presence: true, format: { with: VALID_ALPHA }
  validates :position, presence: true, format: { with: VALID_ALPHA }
  validates :salary, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
  validates :birthday, presence: true # more validation
end
