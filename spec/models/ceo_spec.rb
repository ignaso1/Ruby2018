# frozen_string_literal: true

require 'rails_helper'

describe Ceo, type: :model, class: Ceo do
  it { is_expected.to belong_to(:company) }

  it { is_expected.to validate_presence_of(:salary) }
  it { is_expected.to validate_numericality_of(:salary) }
  it { is_expected.not_to allow_value(-1).for(:salary) }
  it { is_expected.to allow_value(0).for(:salary) }
end
