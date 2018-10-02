require 'simplecov'
SimpleCov.start

require './admin.rb'

describe Admin do
  
  context 'when logged in' do
    before do
      @admin = Admin.new
    end

    it 'can see users list' do
        expect(userList.size).to eq > 0
    end
    it 'can see projects list' do
        expect(projectList.size).to eq > 0
    end

    it 'can change user password' do
        expect(@admin.change_user_password).to be true
    end

    it 'can change user role' do
        expect(@admin.change_user_role).to be true
    end
    
    it 'can delete user account' do
        expect(@admin.deleteUser).to be true

      end
    
    it 'can delete resource' do
        expect(@admin.delete_resource).to be true
    end

    it 'can delete project' do
        expect(@admin.delete_project).to be true
    end

    it 'can not see resource information' do
        expect(@admin.getResourceList.size).to eq > 0
    end
  
    it 'can not see project information' do
        expect(@admin.get_project_list.size).to eq > 0

    end
  
    it 'can not comment' do
        expect(@admin.addComent).to be false
    end
  end
end