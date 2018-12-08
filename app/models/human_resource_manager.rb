# frozen_string_literal: true

require 'user'
# Human resource manager class
class HumanResourceManager < User
  has_many :potential_resources
  has_many :resources, as: :manageable
end
