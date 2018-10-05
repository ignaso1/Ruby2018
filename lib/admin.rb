# Admin class used as a base for other classes
class Admin
  def initialize
    @information = { user_list: [user: { user_id: nil,
                                         password: nil,
                                         role_type: nil }],
                     project_list: [],
                     comment_list: [],
                     resource_list: [] }
    @information[:comment_list] = []
    @information[:project_list] = []
    @information[:resource_list] = []
  end

  def change_user_password(password)
    @information[:user_list].user.password = password
  end

  def change_user_role(role_type)
    @information[:user_list][:role_type] = role_type
  end

  def delete_user_account(user_id)
    @information[:user_list].delete(user_id)
  end

  def delete_resource(resource_id)
    @information[:resource_list].delete(resource_id)
  end

  def delete_project(project_id)
    @information[:project_list].delete(project_id)
  end

  def add_comment(comment)
    @information[:comments].push comment
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

  def project_information
    @information.fetch(:project_list)
    true
  end

  def information(symbol)
    @information.fetch(symbol.to_sym)
  end
end