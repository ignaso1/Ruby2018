require 'rails_helper'

describe Project do
  context 'when creating' do
    let(:project) do
      described_class.new('project', 5)
    end

    let(:project_other) do
      described_class.new('project', -5)
    end

    it 'gets unique project id upon creation' do
      expect(project).to get_unique_id(project_other.info('id'))
    end

    it 'can initialize a resource requirement' do
      expect(project.info('resource_reqs')).to eq(5)
    end

    it 'does not have a resource requirement with incorrect parameters' do
      expect(project_other.information.key?(:resource_reqs)).to be false
    end

    it 'can have a start date' do
      expect(project.information).to have_key(:start)
    end

    it 'can have a finish date' do
      expect(project.information.key?(:finish)).to be true
    end

    it 'can have a name' do
      expect(project.information.key?(:name)).to be true
    end

    it 'can initialize a name' do
      expect(project.info('name')).to eq('project')
    end

    it 'can have an id' do
      expect(project.information.key?(:id)).to be true
    end

    it 'can have a resource requirements' do
      expect(project.information.key?(:resource_reqs)).to be true
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
      Date.today
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

    it 'cant change finish date without positive length' do
      expect { project.define_finish(-10) }
        .not_to(change { project.information[:finish] })
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

    it 'can have a comment' do
      expect(project).to have_attributes(comments: [comment])
    end

    it 'can only add comments' do
      project.add_comment(project)
      expect(project.comments[1]).not_to be(project)
    end

    it 'can add a comment' do
      expect(project.comments[0].information[:content])
        .to eq('lorem ipsum')
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
      expect(project.resources[0]).to be(resource)
    end

    it 'can only add resources' do
      project.add_resource(project)
      expect(project.resources[1]).not_to be(project)
    end

    it 'can remove a resource' do
      expect { project.remove_resource(resource) }
        .to change { project.resources.include?(resource) }
        .from(true).to(false)
    end
  end
end