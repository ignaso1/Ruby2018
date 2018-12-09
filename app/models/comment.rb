# frozen_string_literal: true

# This is a class for writing comments
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true, length: { maximum: 256 }
  validates :author, presence: true
  validates :creation, presence: true
end
