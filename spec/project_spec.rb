require 'spec_helper'

describe Project do
  context 'when creating' do
    before do
      @project = Project.new('project', 5)
      @project_other = Project.new('project', -5)
    end

    it 'gets a project id upon creation' do
      expect(@project.info('project_id')).to_not be_nil
    end

    it 'has a unique project id' do
      expect(@project.info('project_id'))
        .to_not eql(@project_other.info('project_id'))
    end

    it 'has a resource requirement' do
      expect(@project.info('project_id')).to_not be_nil
    end

    it 'has a positive project requirement number' do
      expect(@project_other.info('resource_reqs')).to be > 0
    end
  end

  context 'when setting timeframe' do
    before do
      @project = Project.new('project', 10)
      @project.define_start(2019, 1, 1)
      @project.define_finish(10)
    end

    it 'has to start before it ends' do
      expect(@project.info('project_start'))
        .to be < @project.info('project_finish')
    end

    it 'has to start in the future' do
      expect(@project.info('project_start'))
        .to be > Date.today
    end

    it 'does not have a start date with incorrect parameters' do
      @project_other = Project.new('project', 5)
      @project_other.define_start(2010, 1, 1)
      expect(@project_other.info('project_start')).to be_nil
    end
  end

  context 'when managing comments' do
    before do
      @comment = Comment.new('user', 'lorem ipsum')
      @project = Project.new('project', 5)
      @project.add_comment(@comment)
    end

    it 'can add a comment' do
      expect(@project.comments[0].info('content')).to eq('lorem ipsum')
    end

    it 'can remove a comment' do
      expect { @project.remove_comment(@comment) }
        .to change { @project.comments.include?(@comment) }
        .from(true).to(false)
    end
  end

  context 'when managing resources' do
    before do
      @resource = Resource.new('lorem', 'ipsum')
      @project = Project.new('project', 10)
      @project.add_resource(@resource)
    end

    it 'can add a resource' do
      expect(@project.resources[0]).to eq(@resource)
    end

    it 'can remove a resource' do
      expect { @project.remove_resource(@resource) }
        .to change { @project.resources.include?(@resource) }
        .from(true).to(false)
    end
  end
end
