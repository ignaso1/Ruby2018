require 'spec_helper'

describe User do
  context 'when not registered' do
    let(:user) do
      described_class.new
    end

    it 'can register without a name' do
      expect { user.register('user@gmail.com', 'pwd') }
        .to change(user, :registered?).from(false).to(true)
    end

    it 'can register with a full name' do
      expect { user.register('user@gmail.com', 'pwd', 'User 1') }
        .to change(user, :registered?).from(false).to(true)
    end
  end

  context 'when registering' do
    let(:user) do
      described_class.new
    end

    let(:user_other) do
      described_class.new('admin')
    end

    before do
      user.register('user@gmail.com', 'pwd', 'User 1')
    end

    it 'gets a user id upon registration' do
      expect(user.information('user_id')).not_to be_nil
    end

    it 'has a unique user id' do
      expect(user.information('user_id')).not_to eql(user_other
                                                        .information('user_id'))
    end

    it 'has an role type' do
      expect(user.information('role_type')).to eql('base')
    end

    it 'can have a different role type' do
      expect(user_other.information('role_type')).to eql('admin')
    end

    it 'enters their email upon registration' do
      user.register('user@gmail.com', 'pwd', 'User 1')
      expect(user.information('email')).to match 'user@gmail.com'
    end

    it 'enters their password upon registration' do
      user.register('user@gmail.com', 'pwd', 'User 1')
      expect(user.information('password')).to match 'pwd'
    end
  end

  context 'when registered, but not logged in' do
    let(:user) do
      described_class.new
    end

    before do
      user.register('user@gmail.com', 'pwd', 'User 1')
    end

    it 'can login' do
      expect { user.login('user@gmail.com', 'pwd') }
        .to change { user.information('is_logged_in') }
        .from(false).to(true)
    end

    it 'must enter the right credentials to login' do
      user.login('user@gmail.com', 'pwd')
      expect(user.information('is_logged_in')).to be true
    end

    it 'cannot login with a wrong password' do
      expect(user.login('user@gmail.com', 'pw1d')).to be false
    end

    it 'cannot login with a wrong email' do
      expect(user.login('use2r@gmail.com', 'pwd')).to be false
    end
  end

  context 'when logged in' do
    let(:user) do
      described_class.new
    end

    before do
      user.register('user@gmail.com', 'pwd', 'User 1')
      user.login('user@gmail.com', 'pwd')
    end

    it 'can see their full name' do
      expect(user.information('full_name')).to eql('User 1')
    end

    it 'can see their email' do
      expect(user.information('email')).to eql('user@gmail.com')
    end

    it 'can see their password' do
      expect(user.information('password')).to eql('pwd')
    end

    it 'can logout' do
      expect { user.logout }.to change { user.information('is_logged_in') }
        .from(true).to(false)
    end
  end
end
