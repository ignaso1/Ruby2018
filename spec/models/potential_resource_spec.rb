# frozen_string_literal: true

require 'rails_helper'

describe PotentialResource, type: :model do
  it { is_expected.to have_many(:comments) }
  it { is_expected.to belong_to(:human_resource_manager) }
end
