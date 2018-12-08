# frozen_string_literal: true

require 'rails_helper'

describe Resource, type: :model do
  it 'has a valid factory' do
    expect(build(:valid_resource)).to be_valid
  end

  it { is_expected.to belong_to(:project) }
  it { is_expected.to belong_to(:company) }

  context 'when validating name/last_name' do
    let(:resource) { create(:resource) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.not_to allow_value('!@').for(:name) }
    it { is_expected.not_to allow_value(123).for(:name) }
    it { is_expected.to allow_value('Name').for(:name) }
    it { is_expected.not_to allow_value('!@').for(:last_name) }
    it { is_expected.not_to allow_value(123).for(:last_name) }
    it { is_expected.to allow_value('LastName').for(:last_name) }
  end

  context 'when validating position' do
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.not_to allow_value(1).for(:position) }
    it { is_expected.to allow_value('Developer').for(:position) }
  end

  context 'when validating salary' do
    it { is_expected.to validate_presence_of(:salary) }
    it { is_expected.to allow_value(1000).for(:salary) }
    it { is_expected.not_to allow_value(-1).for(:salary) }
    it { is_expected.not_to allow_value('salary').for(:salary) }
  end

  context 'when validating birthday' do
    it { is_expected.to validate_presence_of(:birthday) }
  end
end
