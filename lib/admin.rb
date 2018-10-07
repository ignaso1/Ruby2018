require 'user.rb'
require './lib/project_manager.rb'

# Admin class used as a base for other classes
class Admin < User
  attr_reader :projects, :resources, :users
  def initialize
    super('admin')
    @projects = [], @resources = [], @users = []
  end

  def remove_user(user)
    @users.delete(user) if @users.include?(user)
  end

  def cant_see_resource_information
    true
  end

  def cant_see_project_information
    true
  end

  def change_user_password(user, new_password)
    return false unless user.instance_of?(User) && @users.include?(user)
    @users[user_index(user)].change_password(new_password)
  end

  def change_user_role_type(user, new_role_type)
    return unless user.instance_of?(User) && @users.include?(user)

    @users[user_index(user)].change_role_type(new_role_type)
  end

  def delete_resource(project, resource)
    project.remove_resource(resource) if resources.include?(resource)
  end

  def remove_project(project, manager)
    manager.delete_project(project)
  end

  def comment_project(project, comment, user)
    return unless comment.instance_of?(Comment)
    if @users[user_index(user)]
      .get_role_type === 'admin'
      return 0;
    else 
      return 1;
    end
  end

  def user_index(user)
    @users.index(user) if @users.include?(user)
  end

  def project_index(project)
    @projects.index(project) if @projects.include?(project)
  end
end
