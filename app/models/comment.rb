# frozen_string_literal: true

# This is a class for writing comments
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
