require 'spec_helper'

describe Project do
  context 'when creating' do
    let(:project) do
      described_class.new('project', 5)
    end

    let(:project_other) do
      described_class.new('project', -5)
    end

    it 'has a project id upon creation' do
      expect(project.info('id')).not_to be_nil
    end

    it 'has a unique project id' do
      expect(project.info('id'))
        .not_to eql(project_other.info('id'))
    end

    it 'has a resource requirement' do
      expect(project.info('resource_reqs')).not_to be_nil
    end

    it 'has a positive project requirement number' do
      expect(project_other.info('resource_reqs')).to be > 0
    end
  end

  context 'when setting timeframe' do
    let(:project) do
      described_class.new('project', 10)
    end

    let(:project_other) do
      described_class.new('project', 5)
    end

    let(:date) do
      Date.new(2019, 1, 1)
    end

    let(:date_invalid) do
      Date.new(2010, 1, 1)
    end

    before do
      project.define_start(date)
      project.define_finish(10)
      project_other.define_start(date_invalid)
    end

    it 'has to start before it ends' do
      expect(project.info('start'))
        .to be < project.info('finish')
    end

    it 'has to start in the future' do
      expect(project.info('start'))
        .to be > Date.today
    end

    it 'does not have a start date with incorrect parameters' do
      expect(project_other.info('start')).to be_nil
    end
  end

  context 'when managing comments' do
    let(:comment) do
      Comment.new('user', 'lorem ipsum')
    end

    let(:project) do
      described_class.new('project', 5)
    end

    before do
      project.add_comment(comment)
    end

    it 'can add a comment' do
      expect(project.comments[0].info('content')).to eq('lorem ipsum')
    end

    it 'can remove a comment' do
      expect { project.remove_comment(comment) }
        .to change { project.comments.include?(comment) }
        .from(true).to(false)
    end
  end

  context 'when managing resources' do
    let(:project) do
      described_class.new('project', 10)
    end

    let(:resource) do
      Resource.new('lorem', 'ipsum')
    end

    before do
      project.add_resource(resource)
    end

    it 'can add a resource' do
      expect(project.resources[0]).to eq(resource)
    end

    it 'can remove a resource' do
      expect { project.remove_resource(resource) }
        .to change { project.resources.include?(resource) }
        .from(true).to(false)
    end
  end
end
