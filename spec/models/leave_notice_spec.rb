# frozen_string_literal: true

require 'rails_helper'

describe LeaveNotice, type: :model do
  it { is_expected.to belong_to(:resource) }
end
