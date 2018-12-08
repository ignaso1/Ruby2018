# frozen_string_literal: true

require 'rails_helper'

describe ProjectManager, type: :model do
  it 'has a valid factory' do
    expect(build(:valid_pm)).to be_valid
  end

  it { is_expected.to have_many(:projects) }

  context 'when validating number of assigned projects' do
    let(:manager) { create(:valid_pm) }

    it 'can have up to 5 projects' do
      expect { manager.projects.push(create_list(:valid_project, 5)) }
        .to change { manager.projects.size }
        .from(0).to(5)
    end

    it 'cant have more than 5 projects' do
      expect { manager.projects.push(create_list(:valid_project, 6)) }
        .to raise_exception('Too many projects')
    end
  end
end
