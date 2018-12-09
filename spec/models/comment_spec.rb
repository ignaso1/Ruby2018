# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :model do
  it 'has a valid factory' do
    expect(create(:comment, :to_resource)).to be_valid
  end

  it { is_expected.to belong_to(:commentable) }

  context 'when validating content' do
    it { is_expected.to validate_length_of(:content).is_at_most(256) }
    it { is_expected.to validate_presence_of(:content) }
  end

  context 'when validating creation' do
    it { is_expected.to validate_presence_of(:creation) }
  end

  context 'when validating author' do
    it { is_expected.to validate_presence_of(:author) }
  end
end
