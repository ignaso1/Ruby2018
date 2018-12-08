# frozen_string_literal: true

# Represents a project manager
class Project < ApplicationRecord
  belongs_to :project_manager
  validates  :name, presence: true, length: { maximum: 100 }
  validates  :resource_reqs, inclusion: 1..30
  validates  :start, presence: true # more validation
  validates  :finish, presence: true # more validation
end
