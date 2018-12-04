# frozen_string_literal: true

require 'rails_helper'

describe Project, type: :model do
  it { is_expected.to belong_to(:project_manager) }

  context 'when validating' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:start) }
    it { is_expected.to validate_presence_of(:finish) }
    it { is_expected.to validate_inclusion_of(:resource_reqs).in_range(1..30) }
  end
end
