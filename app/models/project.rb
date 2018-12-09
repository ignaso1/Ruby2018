# frozen_string_literal: true

# Represents a project manager
class Project < ApplicationRecord
  belongs_to :project_manager
  has_many :comments, as: :commentable
  has_many :resources, as: :manageable

  validates  :name, presence: true, length: { maximum: 100 },
                    format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates  :resource_reqs, inclusion: 1..30
  validates  :start, presence: true # more validation
  validates  :finish, presence: true # more validation
end
