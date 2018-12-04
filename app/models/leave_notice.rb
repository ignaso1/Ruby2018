# frozen_string_literal: true

# This is a leave notice class
class LeaveNotice < ApplicationRecord
  attr_reader :information
  def initialize(leave_type)
    @information = { start: nil,
                     finish: nil }
    @information[:id] = self
    @information[:type] = leave_type
  end

  def define_start(date)
    @information[:start] = date if date > Date.today
  end

  def define_finish(length)
    return unless length.positive?

    @information[:finish] = information.fetch(:start) + length
  end
end
