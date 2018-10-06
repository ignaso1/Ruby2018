# Admin class used as a base for other classes
# Admin class used as a base for other classes
require './lib/user.rb'

class Admin < User
  attr_reader :projects, :resources, :users

  def initialize
    @projects = [], @resources = [], @users = []
  end

  def remove_user(user)
    @users.delete(user) if @users.include?(user)
  end

  def can_not_see_resource_information(user)
    if @users[user_index(user)]
      .information[:role_type] === 'admin'
      return 0;
    else return 1;
    end
  end

  def can_not_see_project_information(user) 
    if @users[user_index(user)]
      .information[:role_type] === 'admin'
      return 0;
    else return 1;
    end
  end

  def change_user_password(user, new_password)
    return unless user.instance_of?(User) && @users.include?(user)

    @users[user_index(user)]
      .information[:password] = new_password
  end

  def change_user_role_type(user, new_role_type)
    return unless user.instance_of?(User) && @users.include?(user)

    @users[user_index(user)]
      .information[:role_type] = new_role_type
  end

  def delete_resource(project, resource)
    return project.remove_resource(resource)
  end

  def remove_project(project)
    return @projects.delete(project) if projects.include?(project)
  end

  def comment_project(project, comment, user)
    return unless comment.instance_of?(Comment)
    if @users[user_index(user)]
      .information[:role_type] === 'admin'
      return 0;
    else 
    @projects[project_index(project)]
      .comments << comment
    end
  end

  def user_index(user)
    return @users.index(user) if @users.include?(user)
  end
end
