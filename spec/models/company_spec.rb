# frozen_string_literal: true

require 'rails_helper'

describe Company, type: :model do
  it { is_expected.to belong_to(:admin) }
  it { is_expected.to have_many(:resources) }
  it { is_expected.to have_one(:ceo) }

  context 'when validating debt' do
    let(:company) { create(:company) }

    it { is_expected.to validate_presence_of(:debt) }
    it { is_expected.to validate_numericality_of(:debt) }
    it { is_expected.not_to allow_value(-1).for(:debt) }
    it { is_expected.to allow_value(0).for(:debt) }
  end

  context 'when validating name' do
    let(:company) { create(:company) }

    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.not_to allow_value('!@').for(:name) }
    it { is_expected.not_to allow_value(123).for(:name) }
    it { is_expected.to allow_value('Company Name').for(:name) }
  end
end
