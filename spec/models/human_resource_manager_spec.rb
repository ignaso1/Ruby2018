# frozen_string_literal: true

require 'rails_helper'

describe HumanResourceManager do
  it { is_expected.to have_many(:resources) }
  it { is_expected.to have_many(:potential_resources) }
end
