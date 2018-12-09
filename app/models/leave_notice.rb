# frozen_string_literal: true

# This is a leave notice class
class LeaveNotice < ApplicationRecord
  belongs_to :resource

  validates :reason, presence: true,
                     format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :start, presence: true
  validates :finish, presence: true
end
