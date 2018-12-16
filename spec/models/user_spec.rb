# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:valid_user, :role_admin)).to be_valid
  end

  context 'when validating name/last_name' do
    let(:valid_user) { build(:valid_user) }

    it { expect(valid_user).to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { expect(valid_user).to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(50) }
  end

  context 'when validating role' do
    let(:invalid_user) { build(:user, :invalid_role) }

    it { is_expected.not_to allow_value(invalid_user.role).for(:role) }
    it { is_expected.to allow_value('admin').for(:role) }
  end

  context 'when validating email' do
    let(:valid_user) { build(:valid_user) }
    let(:invalid_user) { build(:user, :invalid_email_format) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to allow_value(valid_user.email).for(:email) }
    it { is_expected.not_to allow_value(invalid_user.email).for(:email) }
  end

  context 'when validating password' do
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end
end
