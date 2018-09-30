require 'simplecov'
SimpleCov.start

require './user.rb'

describe User do
  context 'when not registered' do

    before do
      @user = User.new
    end

    it 'can register' do
      expect { @user.register('user@gmail.com', 'pwd', 'User 1') }
        .to change { @user.registered? }.from(false).to(true)
    end

    it 'can register without a name' do
      expect { @user.register('user@gmail.com', 'pwd') }
        .to change { @user.registered? }.from(false).to(true)
    end

    it 'can register with a full name' do
      expect { @user.register('user@gmail.com', 'pwd', 'User 1') }
        .to change { @user.registered? }.from(false).to(true)
    end
  end

  context 'when registering' do
    before do
      @user = User.new
      @user.register('user@gmail.com', 'pwd', 'User 1')
      @user_other = User.new('admin')
    end

    it 'gets a user id upon registration' do
      expect(@user.information('user_id')).to_not be_nil
    end

    it 'has a unique user id' do
      expect(@user.information('user_id')).to_not eql(@user_other
                                                        .information('user_id'))
    end

    it 'has an role type' do
      expect(@user.information('role_type')).to eql('base')
    end

    it 'can have a different role type' do
      expect(@user_other.information('role_type')).to eql('admin')
    end

    it 'enters their email upon registration' do
      @user.register('user@gmail.com', 'pwd', 'User 1')
      expect(@user.information('email')).to match 'user@gmail.com'
    end

    it 'enters their password upon registration' do
      @user.register('user@gmail.com', 'pwd', 'User 1')
      expect(@user.information('password')).to match 'pwd'
    end
  end

  context 'when registered, but not logged in' do
    before do
      @user = User.new
      @user.register('user@gmail.com', 'pwd', 'User 1')
    end

    it 'can login' do
      expect { @user.login('user@gmail.com', 'pwd') }
        .to change { @user.information('is_logged_in') }
        .from(false).to(true)
    end

    it 'must enter the right password to login' do
      expect(@user.login('user@gmail.com', 'pw1d')).to be false
      expect(@user.login('user@gmail.com', 'pwd')).to be true
    end

    it 'must enter the right email to login' do
      expect(@user.login('us2er@gmail.com', 'pwd')).to be false
      expect(@user.login('user@gmail.com', 'pwd')).to be true
    end
  end

  context 'when logged in' do
    before do
      @user = User.new
      @user.register('user@gmail.com', 'pwd', 'User 1')
      @user.login('user@gmail.com', 'pwd')
    end

    it 'can see their full name' do
      expect(@user.information('full_name')).to eql('User 1')
    end

    it 'can see their email' do
      expect(@user.information('email')).to eql('user@gmail.com')
    end

    it 'can see their password' do
      expect(@user.information('password')).to eql('pwd')
    end

    it 'can logout' do
      expect { @user.logout }.to change { @user.information('is_logged_in') }
        .from(true).to(false)
    end
  end
end