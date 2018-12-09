# frozen_string_literal: true

require 'rails_helper'

describe Project, type: :model do
  it 'has a valid factory' do
    expect(create(:project)).to be_valid
  end

  it { is_expected.to belong_to(:project_manager) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:resources) }

  context 'when validating' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.not_to allow_value('!@').for(:name) }
    it { is_expected.not_to allow_value(123).for(:name) }
    it { is_expected.to allow_value('Project').for(:name) }
    it { is_expected.to validate_presence_of(:start) }
    it { is_expected.to validate_presence_of(:finish) }
    it { is_expected.to validate_inclusion_of(:resource_reqs).in_range(1..30) }
  end
end
