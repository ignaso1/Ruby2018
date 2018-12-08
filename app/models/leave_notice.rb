# frozen_string_literal: true

# This is a leave notice class
class LeaveNotice < ApplicationRecord
  belongs_to :resource
end
