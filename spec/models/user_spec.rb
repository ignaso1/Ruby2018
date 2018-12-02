require 'rails_helper'

describe User, type: :model do
  
  it 'has a valid factory' do
    expect(build(:valid_user)).to be_valid
  end

  context 'when validating name/last_name' do
    let(:valid_user) { build(:valid_user) }

    it { expect(valid_user).to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { expect(valid_user).to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(50) }
  end

  context 'validates email' do
  end
end
