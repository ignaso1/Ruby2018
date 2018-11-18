class User < ApplicationRecord
    def initialize(role_type = 'base')
        @information = { user_id: nil,
                            is_logged_in: false }
        @information[:role_type] = 'base'
    end

    def register(email, password, full_name = nil)
    @information[:user_id] = self
    @information[:full_name] = full_name
    @information[:email] = email
    @information[:password] = password
    end

    def login(email, password)
    return false unless login?(email, password)

    @information[:is_logged_in] = true
    end

    def login?(email, password)
    email.eql?(@information.fetch(:email)) &&
        password.eql?(@information.fetch(:password))
    end

    def logout
    @information[:is_logged_in] = false
    end

    def registered?
    !@information.fetch(:user_id).equal?(nil)
    end

    def change_password(password)
    @information[:password] = password
    end

    def password_length(password)
        # @information[:password] = password
        password.length > 4
    end

    def change_name(full_name)
    @information[:full_name] = full_name
    end

    def change_role_type(role_type)
    @information[:role_type] = role_type
    end

    def information(symbol)
    @information.fetch(symbol.to_sym)
    end
end

# class User < ApplicationRecord

#     scope :active_users, -> { where(is_logged_in: true) }
#     scope :inactive_users, -> { where(is_logged_in: false) }

#     validates :user_id, presence: true
#     validates :password, presence: true
#     validates :email, presence: true
# end