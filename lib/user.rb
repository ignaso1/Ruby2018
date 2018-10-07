# User class used as a base for other classes
class User
  def initialize(role_type = 'base')
    @information = { user_id: nil,
                     is_logged_in: false }
    @information[:role_type] = role_type
  end

  def register(email, password, full_name = nil)
    @information[:user_id] = self
    @information[:full_name] = full_name
    @information[:email] = email
    @information[:password] = password
  end

  def login(email_value, password_value)
    return false unless email_value.eql?(@information.fetch(:email)) &&
                        password_value.eql?(@information.fetch(:password))

    @information[:is_logged_in] = true
  end

  def logout
    @information[:is_logged_in] = false
  end

  def registered?
    return true unless @information.fetch(:user_id).equal?(nil)

    false
  end

  def change_password(password)
    @information[:password] = password
  end

  def change_role_type(role_type)
    @information[:role_type] = role_type
  end

  def get_role_type
    @role_type
  end

  def information(symbol)
    @information.fetch(symbol.to_sym)
  end
end
