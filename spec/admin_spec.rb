require 'spec_helper'

describe Admin do
  context 'when logged in' do
    let(:user) { User.new }
    let(:admin) { described_class.new }
    let(:manager) { ProjectManager.new }
    let(:project) { Project.new('project', 5) }
    let(:resource) { Resource.new('lorem', 'ipsum') }
    let(:comment) { Comment.new('author', 'content') }

    before do
      user.register('banana', 'banana', 'banana')
      admin.users << user
      project.add_resource(resource)
      manager.projects << project
      admin.projects << project
      admin.resources << resource
    end

    it 'can delete user' do
      admin.remove_user(user)
      expect(admin.users).to be_empty
    end

    it 'can see users list' do
      expect(admin.users[0]).to eql(user)
    end

    it 'can see projects list' do
      expect(manager.projects[0]).to eql(project)
    end

    it 'can not see resource information' do
      expect(admin.cant_see_resource_information).to be true
    end

    it 'can not see project information' do
      expect(admin.cant_see_project_information).to be true
    end

    it 'can change user password' do
      expect { admin.change_user_password(user, 'abc123') }
        .to change { admin.users[0].information('password') }
        .from('banana').to('abc123')
    end

    it 'can change user role type' do
      expect { admin.change_user_role_type(user, 'abc123') }
        .to change { admin.users[0].information('role_type') }
        .from('base').to('abc123')
    end

    it 'can remove a resource' do
      expect { admin.delete_resource(project, resource) }
        .to change { project.resources.include?(resource) }
        .from(true).to(false)
    end

    it 'can remove project' do
      expect { admin.remove_project(project, manager) }
        .to change { manager.projects.include?(project) }
        .from(true).to(false)
    end

    it 'can not comment' do
      admin.comment_project(project, comment, user)
      expect(manager.projects[0].comments[0])
        .to eq(manager.projects[0].comments[0])
    end
  end
end
