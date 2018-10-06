require 'spec_helper'


describe Admin do
  context 'when logged in' do
    before do
      @admin = Admin.new
      @user = User.new('admin')
      @user.register('banana', 'banana', 'banana')
      @admin.users << @user
      @manager = ProjectManager.new
      @project = Project.new('project', 5)
      @resource = Resource.new('lorem', 'ipsum')
      @comment = Comment.new('author', 'content')
      @project.add_resource(@resource)
      @manager.projects << @project
      @project.add_resource(@resource)
    end
    it 'can delete user' do
      @admin.users << @user
            expect { @admin.remove_user(@user) }
        .to change { @admin.users[0]}
        .from(@user).to(nil)
    end

    it 'can see users list' do
      expect(@admin.users[0]).to eql(@user)
    end

    it 'can see projects list' do
      expect(@manager.projects[0]).to eql(@project)
    end

    it 'can not see resource information' do
      expect(@admin.can_not_see_resource_information(@user)).to eq(0)
    end

    it 'can not see project information' do
      expect(@admin.can_not_see_project_information(@user)).to eq(0)
    end

    it 'can change user password' do
      expect { @admin.change_user_password(@user, 'abc123') }
        .to change { @admin.users[0].information[:password] }
        .from('banana').to('abc123')
    end

    it 'can change user role type' do
      expect { @admin.change_user_role_type(@user, 'abc123') }
        .to change { @admin.users[0].information[:role_type] }
        .from('admin').to('abc123')
    end

    it 'can remove a resource' do
      expect { @admin.delete_resource(@project, @resource) }
        .to change { @project.resources.include?(@resource) }
        .from(true).to(false)
    end

    it 'can remove project' do
      expect { @admin.remove_project(@project) }
        .to change { @manager.projects.include?(@project) }
        .from(true).to(false)
    end

    it 'can not comment' do
      @admin.comment_project(@project, @comment, @user)
      expect(@manager.projects[0].comments[0]).to eq(@manager.projects[0].comments[0])
    end
  end
end
