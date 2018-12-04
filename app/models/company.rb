# frozen_string_literal: true

# This represents the Company
class Company < ApplicationRecord
  attr_reader :information, :resources, :ceo
  def initialize(ceo)
    @information = { name: nil,
                     id: nil,
                     debt: 0 }
    information[:ceo] = ceo if ceo.instance_of?(Ceo)
    @resources = []
  end

  def register(name)
    return if registered?

    information[:id] = self
    information[:name] = name
  end

  def change_name(name)
    information[:name] = name if registered?
  end

  def registered?
    information.fetch(:id).equal?(self)
  end

  def running?
    registered? && !bankrupt?
  end

  def unregister
    information[:id] = nil
    information[:name] = nil
    information[:debt] = 0
    resources.clear
  end

  def replace_ceo(new_ceo)
    information[:ceo] = new_ceo if new_ceo.instance_of?(Ceo)
  end

  def bankrupt?
    information.fetch(:debt).positive?
  end
end
