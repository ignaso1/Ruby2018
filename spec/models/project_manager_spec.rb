# frozen_string_literal: true

require 'rails_helper'

describe ProjectManager, type: :model do
  it { is_expected.to have_many(:projects) }
end