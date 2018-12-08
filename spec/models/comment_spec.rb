# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :model do
  it 'has a valid factory' do
    expect(create(:comment, :to_resource)).to be_valid
  end

  it { is_expected.to belong_to(:commentable) }
end
