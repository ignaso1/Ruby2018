# Admin class used as a base for other classes
class Admin
  def initialize
    @information = { 
      user_list: [ 
        user: {
          user_id: nil,
          password: nil,
          role_type: nil
        }
      ],
      project_list: [],
      comment_list: [],
      resource_list: [] 
    }
  end

  def user_list
    @information.fetch(:user_list)
  end

  def project_list
    @information.fetch(:project_list)
  end

  def resource_list
    @information.fetch(:resource_list)
  end

  def change_user_password
    @information.fetch(:user_list) = "new_password"
  end

  def get_project_information(project_list)
    @information.fetch(:project_list)
    true
  end

  def change_user_role(user_list)
    @information.fetch(:user_list).role_type = new_role_type
    true
  end

  def delete_user_account(user_id, user_list)
    @information.fetch(:user_list).delete(user_id)
  end

  def delete_resource(resource_id, resource_list)
    @information.fetch(:resource_list).delete(resource_id)
  end

  def delete_project(project_id, project_list)
    @information.fetch(:project_list).delete(project_id)
  end

  def add_comment(comment, comment_list)
    @information.comment_list.push(comment)
  end
end