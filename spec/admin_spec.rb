require 'spec_helper'

describe Admin do
  context 'when logged in' do
    let(:admin) do
      described_class.new
    end

    it 'can see users list' do
      expect(admin.user_list.size).to be(1)
    end
    it 'can see projects list' do
      expect(admin.project_list.size).to be(0)
    end

    it 'can not see resource information' do
      expect(admin.resource_list.size).to be(0)
    end

    it 'can change user password' do
      expect(admin.change_user_password).to be true
    end

    it 'can not see project information' do
      expect(admin.project_list).to be([])
    end

    it 'can change user role' do
      expect(admin.change_user_role).to be true
    end

    it 'can delete user account' do
      expect(admin.delete_user_account).to be true
    end

    it 'can delete resource' do
      expect(admin.delete_resource).to be true
    end

    it 'can delete project' do
      expect(admin.delete_project).to be true
    end

    it 'can not comment' do
      expect { admin.add_comment('abc') }
        .to change { admin.information('comments').length }
        .from(admin.information('comments').length)
        .to(admn.information('comments').length)
    end
  end
end
