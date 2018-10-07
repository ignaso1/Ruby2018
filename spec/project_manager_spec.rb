require 'spec_helper'

describe ProjectManager do
  context 'when managing projects' do
    let(:manager) do
      described_class.new
    end

    let(:project) do
      Project.new('project', 5)
    end

    let(:project_other) do
      Project.new('project', 10)
    end

    let(:date) do
      Date.new(2019, 1, 1)
    end

    before do
      manager.projects << project << project_other
    end

    it 'can have multiple projects' do
      expect(manager.projects.all? { |i| i.is_a? Project }).to be true
    end

    it 'can change human resource requirements' do
      expect { manager.change_project_reqs(project, 20) }
        .to change { manager.projects[0].information[:resource_reqs] }
        .from(5).to(20)
    end

    it 'can change projects name' do
      expect { manager.change_project_name(project, 'lorem') }
        .to change { manager.projects[0].information[:name] }
        .from('project').to('lorem')
    end

    it 'can change the start date of the project' do
      expect { manager.define_project_start(project, date) }
        .to change { manager.projects[0].information[:start] }
        .from(nil).to(date)
    end

    it 'can change the finish date of the project' do
      manager.define_project_start(project, date)
      expect { manager.define_project_finish(project, 10) }
        .to change { manager.projects[0].information[:finish] }
        .from(nil).to(date + 10)
    end
  end

  context 'when managing projects resources' do
    let(:manager) do
      described_class.new
    end

    let(:project) do
      Project.new('project', 5)
    end

    let(:resource) do
      Resource.new('lorem', 'ipsum')
    end

    before do
      project.add_resource(resource)
      manager.projects << project
    end

    it 'can see resources assigned to projects' do
      expect(manager.projects[0].resources[0]).to eq(resource)
    end

    it 'can see info about resources' do
      expect(manager.projects[0]
        .resources[0].information.values).to eq(resource.information.values)
    end
  end

  context 'when managing comments' do
    let(:manager) do
      described_class.new
    end

    let(:project) do
      Project.new('project', 5)
    end

    let(:comment) do
      Comment.new('lorem', 'ipsum')
    end

    let(:resource) do
      Resource.new('lorem', 'ipsum')
    end

    before do
      manager.projects << project
      project.add_resource(resource)
    end

    it 'can comment a project' do
      manager.comment_project(project, comment)
      expect(manager.projects[0].comments[0]).to eq(comment)
    end

    it 'can remove a comment from a project' do
      manager.comment_project(project, comment)
      expect { manager.remove_comment_project(project, comment) }
        .to change { manager.projects[0].comments[0] }
        .from(comment).to(nil)
    end

    it 'can comment a resource' do
      manager.comment_res(project, resource, comment)
      expect(manager.projects[0].resources[0]
        .comments[0]).to eq(comment)
    end

    it 'can delete a comment from a resource' do
      manager.comment_res(project, resource, comment)
      expect { manager.remove_comment_res(project, resource, comment) }
        .to change { manager.projects[0].resources[0].comments[0] }
        .from(comment).to(nil)
    end
  end
end
