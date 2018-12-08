# frozen_string_literal: true

# This is a potential resource class
class PotentialResource < ApplicationRecord
  belongs_to :human_resource_manager
  has_many :comments, as: :commentable
end
