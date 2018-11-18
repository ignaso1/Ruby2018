# require 'rails_helper'

# RSpec.describe User, type: :model do
#     context 'validation test' do
#         it 'ensures password presence' do
#             user = User.new(user_id: 'Last', email: 'Email').save
#             expect(user).to eq(false)
#         end

#         it 'ensures first name presence' do
#             user = User.new(password: 'password', email: 'Email').save
#             expect(user).to eq(false)
#         end

#         it 'should save successfully' do
#             user = User.new(password: 'password', email: 'Email', user_id: 'user_id').save
#             expect(user).to eq(true)
#         end
#     end

#     context 'scope tests' do
#         let (:params) { {password: 'password', email: 'Email', user_id: 'user_id'} }
#         before(:each) do
#             User.new(params).save
#             User.new(params).save
#             User.new(params.merge(is_logged_in: true)).save
#             User.new(params.merge(is_logged_in: false)).save
#             User.new(params.merge(is_logged_in: false)).save
#         end

#         it 'should return active users' do
#             expect(User.active_users.size).to eq(1)
#         end

#         it 'should return inactive users' do
#             expect(User.inactive_users.size).to eq(2)
#         end
#     end
# end


require 'rails_helper'

describe User do
  context 'when not registered' do
    let(:user) do
      described_class.new
    end

    it 'does not have an id' do
      expect(user.information('user_id')).to be nil
    end

    it 'is not logged in' do
      expect(user.information('is_logged_in')).to be false
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
      user.register('user@gmail.com', 'passw', 'User 1')
    end

    it 'is considered registered' do
      expect(user).to be_registered
    end

    it 'gets a user id upon registration' do
      expect(user.information('user_id')).not_to be_nil
    end

    it 'has a unique user id' do
      expect(user.information('user_id')).not_to eql(user_other
                                                        .information('user_id'))
    end

    it 'has a role type' do
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

    it 'password should be longer than 4 symbols' do
      user.register('user@gmail.com', 'passw', 'User 1')
      expect(user).to have_password_longer_than_4_sym
    end
  end

  context 'when registered, but not logged in' do
    let(:user) do
      described_class.new
    end

    let(:user2) do
      described_class.new
    end

    before do
      user.register('user@gmail.com', 'pwd', 'User 1')
      user2.register('user2@gmail.com', 'pwd')
    end

    it 'can login' do
      expect { user.login('user@gmail.com', 'pwd') }
        .to change { user.information('is_logged_in') }
        .from(false).to(true)
    end

    it 'cannot login with a wrong password' do
      expect(user.login('user@gmail.com', 'pw1d')).to be false
    end

    it 'cannot login with a wrong email' do
      expect(user.login('use2r@gmail.com', 'pwd')).to be false
    end

    it 'does not have full name if it is not provided' do
      expect(user2.information('full_name')).to be nil
    end

    it 'can assign full name if it was not provided' do
      expect { user2.change_name('user2') }
        .to change { user2.information('full_name') }
        .from(nil).to('user2')
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

    it 'can see their id' do
      expect(user.information('user_id')).to eql(user.itself)
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

    it 'can change their password' do
      expect { user.change_password('pass') }
        .to change { user.information('password') }.from('pwd').to('pass')
    end

    it 'can have their role changed' do
      expect { user.change_role_type('admin') }
        .to change { user.information('role_type') }.from('base').to('admin')
    end

    it 'can logout' do
      expect { user.logout }.to change { user.information('is_logged_in') }
        .from(true).to(false)
    end
  end
end