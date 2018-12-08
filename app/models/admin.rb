# frozen_string_literal: true

# models a user with admin privileges
class Admin < User
  has_one :company
end
