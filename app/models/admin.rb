# frozen_string_literal: true

require_relative 'user'
require_relative 'project_manager'

# Admin class used as a base for other classes
class Admin < User
  attr_reader :projects, :resources, :users
  def initialize
    super('admin')
    @projects = []
    @resources = []
    @users = []
  end

  def remove_user(user)
    users.delete(user)
  end

  def cant_see_resource_information
    true
  end

  def cant_see_project_information
    true
  end

  def change_user_password(user, new_password)
    users.fetch(users.index(user)).change_password(new_password)
  end

  def change_user_role_type(user, new_role_type)
    users.fetch(users.index(user)).change_role_type(new_role_type)
  end

  def delete_resource(resource)
    resources.delete(resource)
  end

  def remove_project(project)
    projects.delete(project)
  end

  def comment_project
    false
  end
end
