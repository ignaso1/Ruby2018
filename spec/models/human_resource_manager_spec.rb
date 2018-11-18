require 'rails_helper'

describe HumanResourceManager do
  context 'when managing projects' do
    let(:hr_manager) { described_class.new }
    let(:project) { Project.new('project', 5) }
    let(:project_other) { Project.new('project', 10) }
    let(:date) { Date.new(2018, 12, 3) }
    let(:date_other) { Date.new(2019, 12, 3) }

    before do
      hr_manager.projects << project << project_other
    end

    it 'can have a project' do
      expect(hr_manager).to have_attributes(projects: [project, project_other])
    end

    it 'can have multiple projects' do
      expect(hr_manager.projects.all? { |i| i.is_a? Project }).to be true
    end

    it 'can change human resource requirements' do
      expect { hr_manager.change_project_reqs(project.information[:id], 10) }
        .to change { hr_manager.projects[0].information[:resource_reqs] }
        .by(5)
    end

    it 'can change projects name' do
      expect do
        hr_manager.change_project_name(project.information[:id], 'project2')
      end.to change { hr_manager.projects[0].information[:name] }
        .from('project').to('project2')
    end

    it 'can change the start date of the project' do
      expect do
        hr_manager.projects.fetch(hr_manager.project_index(project
        .information[:id])).define_start(date)
      end.to change { hr_manager.projects[0].information[:start] }
        .from(nil).to(date)
    end
  end

  context 'when managing project end date' do
    let(:hr_manager) { described_class.new }
    let(:project) { Project.new('project', 5) }
    let(:date) { Date.new(2018, 12, 3) }

    before do
      hr_manager.projects << project
      hr_manager.projects.fetch(hr_manager.project_index(project
      .information[:id])).define_start(date)
    end

    it 'can change the finish date of the project' do
      expect do
        hr_manager.projects.fetch(hr_manager
        .project_index(project.information[:id])).define_finish(10)
      end.to change { hr_manager.projects[0].information[:finish] }
        .from(nil).to(date + 10)
    end
  end

  context 'when managing resources can' do
    let(:hr_manager) { described_class.new }
    let(:resource) { Resource.new('Smth', 'Smith') }
    let(:resource_other) { Resource.new('Smth2', 'Smith') }
    let(:date) { Date.new(2018, 11, 3) }

    before do
      hr_manager.resources << resource << resource_other
    end

    it 'have a resource' do
      expect(hr_manager)
        .to have_attributes(resources: [resource, resource_other])
    end

    it 'have multiple resources' do
      expect(hr_manager.resources.all? { |i| i.is_a? Resource }).to be true
    end

    it 'change resource last name' do
      expect do
        hr_manager.change_resource_last_name(resource.information[:id], 'Smth2')
      end
        .to change { hr_manager.resources[0].information[:last_name] }
        .from('Smith').to('Smth2')
    end

    it 'change resource name' do
      expect do
        hr_manager.change_resource_name(resource.information[:id], 'Smth3')
      end
        .to change { hr_manager.resources[0].information[:name] }
        .from('Smth').to('Smth3')
    end

    it 'change the birthday date of the resource' do
      expect do
        hr_manager.change_resource_birthday(resource.information[:id], date)
      end
        .to change { hr_manager.resources[0].information[:birthday] }
        .from(nil).to(date)
    end

    it 'change resource position' do
      expect do
        hr_manager.change_resource_position(resource
        .information[:id], 'Developer')
      end.to change { hr_manager.resources[0].information[:position] }
        .from(nil).to('Developer')
    end
  end

  context 'when managing projects resources' do
    let(:hr_manager) { described_class.new }
    let(:project) { Project.new('project', 5) }
    let(:resource) { Resource.new('Smth', 'Smith') }

    before do
      project.add_resource(resource)
      hr_manager.projects << project
    end

    it 'can see resources assigned to projects' do
      expect(hr_manager.projects[0].resources[0]).to eq(resource)
    end

    it 'can see resource position' do
      expect(hr_manager.projects[0]
        .resources[0].information[:position])
        .to eq(resource.information[:position])
    end

    it 'can see resource name' do
      expect(hr_manager.projects[0]
        .resources[0].information[:name]).to eq(resource.information[:name])
    end

    it 'can see resource last name' do
      expect(hr_manager.projects[0]
        .resources[0].information[:last_name])
        .to eq(resource.information[:last_name])
    end

    it 'can see resource salary' do
      expect(hr_manager.projects[0]
        .resources[0].information[:salary])
        .to eq(resource.information[:salary])
    end

    it 'can see resource birthday' do
      expect(hr_manager.projects[0]
        .resources[0].information[:birthday])
        .to eq(resource.information[:birthday])
    end

    it 'can see resource id' do
      expect(hr_manager.projects[0]
        .resources[0].information[:id]).to eq(resource.information[:id])
    end
  end
end