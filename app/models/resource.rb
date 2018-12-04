# frozen_string_literal: true

# This is a resource class
class Resource < ApplicationRecord
  attr_reader :leave_notices, :comments, :information
  def initialize(name, last_name)
    @information = { position: nil, salary: nil,
                     birthday: nil }
    @information[:id] = self
    @information[:name] = name
    @information[:last_name] = last_name
    @comments = []
    @leave_notices = []
  end
end
