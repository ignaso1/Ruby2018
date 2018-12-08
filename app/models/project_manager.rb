# frozen_string_literal: true

# Represents a project manager
class ProjectManager < User
  MAX_PROJECTS = 5
  has_many :projects, before_add: :validate_project_limit

  def validate_project_limit(_project)
    raise('Too many projects') if projects.size.equal?(MAX_PROJECTS)
  end
end
