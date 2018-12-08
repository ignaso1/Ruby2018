# frozen_string_literal: true

# Represents a user
class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 8 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :role, presence: true, inclusion:
            { in: %w[admin project_manager hr_manager ceo] }
end
