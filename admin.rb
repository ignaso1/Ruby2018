# Admin class used as a base for other classes
class Admin
  def get_user_list(user_list)
    user_list.fetch
  end

  def get_project_list(project_list)
    project_list.fetch
  end

  def get_resource_information(resource_list)
    resource_list.fetch
  end

  def get_project_information(project_list)
    project_list.fetch
  end

  def change_user_password(new_password)
    project_list.password_value = new_password
  end

  def change_user_role(user_list)
    user_list.role_type = new_role_type

  end

  def delete_user_account(user_id, user_list)
    user_list.delete(user_id)
  end

  def delete_resource(resource_id, resource_list)
    resource_list.delete(resource_id)
  end

  def delete_project(project_id, project_list)
    project_list.delete(project_id)
  end

  def add_comment(comment, comment_list)
    comment_list.push(comment)
  end
end