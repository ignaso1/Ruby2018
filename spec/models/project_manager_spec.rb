# frozen_string_literal: true

require 'rails_helper'

describe ProjectManager, type: :model do
  it 'has a valid factory' do
    expect(build(:project_manager)).to be_valid
  end

  it { is_expected.to have_many(:projects) }

  context 'when validating number of assigned projects' do
    let(:manager) { create(:project_manager) }

    it 'can have up to 5 projects' do
      expect { manager.projects.push(create_list(:project, 5)) }
        .to change { manager.projects.size }
        .from(0).to(5)
    end

    it 'cant have more than 5 projects' do
      expect { manager.projects.push(create_list(:project, 6)) }
        .to raise_exception('Too many projects')
    end
  end
end
