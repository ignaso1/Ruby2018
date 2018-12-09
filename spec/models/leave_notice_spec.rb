# frozen_string_literal: true

require 'rails_helper'

describe LeaveNotice, type: :model do
  it 'has a valid factory' do
    expect(create(:valid_leave_notice)).to be_valid
  end

  it { is_expected.to belong_to(:resource) }

  context 'when validating date' do
    it { is_expected.to validate_presence_of(:start) }
    it { is_expected.to validate_presence_of(:finish) }
  end

  context 'when validating reason' do
    it { is_expected.to validate_presence_of(:reason) }
    it { is_expected.not_to allow_value('!@').for(:reason) }
    it { is_expected.not_to allow_value(123).for(:reason) }
    it { is_expected.to allow_value('Sick').for(:reason) }
  end
end
