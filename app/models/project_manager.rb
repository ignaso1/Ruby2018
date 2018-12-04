# frozen_string_literal: true

# Represents a project manager
class ProjectManager < User
  has_many :projects
  # has_many :resources, through: :projects
  # validate :projects, presence: true
end
