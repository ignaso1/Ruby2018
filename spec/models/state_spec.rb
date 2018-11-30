require 'rails_helper'
require 'tempfile'

describe State do
  context 'when creating a state' do
    let(:state) do
        described_class.new
    end

    it 'can contain projects' do
      expect(state.information.key?(:projects)).to be true
    end

    it 'can contain users' do
      expect(state.information.key?(:users)).to be true
    end

    it 'can contain an admin user' do
      expect(state.information.key?(:admin)).to be true
    end

    it 'can contain ceo' do
      expect(state.information.key?(:ceo)).to be true
    end

    it 'can contain company' do
      expect(state.information.key?(:company)).to be true
    end
  end

  context 'when saving state to a yaml file can store' do
    let(:state) { described_class.new }
    let(:project) { Project.new('project', 5) }
    let(:user) { User.new }
    let(:admin) { Admin.new }
    let(:tempfile) { Tempfile.new(['test_state', '.yml'], Dir.pwd) }

    before do
      state.information[:projects] << project
      state.information[:users] << user
      state.information[:admin] = admin
      state.save(tempfile.path)
    end

    # it 'projects' do
    #   data = YAML.load_file(tempfile.path)
    #   expect(data[:projects][0].instance_of?(Project)).to be true
    # end

    # it 'users' do
    #   data = YAML.load_file(tempfile.path)
    #   expect(data[:users][0].instance_of?(User)).to be true
    # end

    # it 'admin' do
    #   data = YAML.load_file(tempfile.path)
    #   expect(data[:admin].instance_of?(Admin)).to be true
    # end
  end

  context 'when loading state data from file ' do
    let(:state) { described_class.new }
    let(:project) { Project.new('project', 5) }
    let(:user) { User.new }
    let(:admin) { Admin.new }
    let(:tempfile) { Tempfile.new(['test_state', '.yml'], Dir.pwd) }

    before do
      state.information[:projects] << project
      state.information[:users] << user
      state.information[:admin] = admin
      state.save(tempfile.path)
      state.clear
    end

    # it 'fails if it cannot find the file specified' do
    #   expect(state.load_details('./badfilepath.yml')).to be(false)
    # end

    # it 'can load users' do
    #   expect { state.load_details(tempfile.path) }
    #     .to change { state.information[:users][0].instance_of?(User) }
    #     .from(false).to(true)
    # end

    # it 'can load projects' do
    #   expect { state.load_details(tempfile.path) }
    #     .to change { state.information[:projects][0].instance_of?(Project) }
    #     .from(false).to(true)
    # end

    # it 'can load admin' do
    #   expect { state.load_details(tempfile.path) }
    #     .to change { state.information[:admin].instance_of?(Admin) }
    #     .from(false).to(true)
    # end
  end

  context 'when updating' do
    let(:state) { described_class.new }
    let(:project) { Project.new('project', 5) }
    let(:user) { User.new }
    let(:admin) { Admin.new }
    let(:ceo) { Ceo.new }
    let(:company) { Company.new(ceo) }

    # it 'projects' do
    #   expect { state.update_projects([project]) }
    #     .to change { state.information[:projects] }
    #     .from([]).to([project])
    # end

    # it 'users' do
    #   expect { state.update_users([user]) }
    #     .to change { state.information[:users] }
    #     .from([]).to([user])
    # end

    # it 'admin' do
    #   expect { state.update_admin(admin) }
    #     .to change { state.information[:admin] }
    #     .from(nil).to(admin)
    # end

    # it 'company' do
    #   expect { state.update_company(company) }
    #     .to change { state.information[:company] }
    #     .from(nil).to(company)
    # end

    # it 'ceo' do
    #   expect { state.update_ceo(ceo) }
    #     .to change { state.information[:ceo] }
    #     .from(nil).to(ceo)
    # end
  end

  context 'when clearing state data can clear' do
    let(:state) { described_class.new }
    let(:project) { Project.new('project', 5) }
    let(:user) { User.new }
    let(:admin) { Admin.new }
    let(:ceo) { Ceo.new }
    let(:company) { Company.new(ceo) }

    before do
      state.information[:projects] << project
      state.information[:users] << user
      state.information[:admin] = admin
      state.information[:ceo] = ceo
      state.information[:company] = company
    end

    # it 'all of user data' do
    #   expect { state.clear }
    #     .to change { state.information[:users] }
    #     .from([user]).to([])
    # end

    # it 'all of project data' do
    #   expect { state.clear }
    #     .to change { state.information[:projects] }
    #     .from([project]).to([])
    # end

    # it 'all of admin data' do
    #   expect { state.clear }
    #     .to change { state.information[:admin] }
    #     .from(admin).to(nil)
    # end

    # it 'all of ceo data' do
    #   expect { state.clear }
    #     .to change { state.information[:ceo] }
    #     .from(ceo).to(nil)
    # end

    # it 'all of company data' do
    #   expect { state.clear }
    #     .to change { state.information[:company] }
    #     .from(company).to(nil)
    # end
  end

  context 'when checking if state is empty' do
    let(:state) { described_class.new }
    let(:project) { Project.new('project', 5) }
    let(:user) { User.new }
    let(:admin) { Admin.new }

    # it 'can detect projects' do
    #   expect { state.information[:projects] << project }
    #     .to change(state, :empty?)
    #     .from(true).to(false)
    # end

    # it 'can detect users' do
    #   expect { state.information[:users] << user }
    #     .to change(state, :empty?)
    #     .from(true).to(false)
    # end

    # it 'can be empty' do
    #   expect(state.empty?).to be true
    # end
  end
end