# frozen_string_literal: true

require 'date'

# This is a class for writing comments
class Comment < ApplicationRecord
  attr_reader :information
  def initialize(author, content)
    @information = { creation_date: Date.today }
    @information[:id] = self
    @information[:author] = author
    @information[:content] = content
  end
end
