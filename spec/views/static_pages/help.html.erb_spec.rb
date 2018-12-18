# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'static_pages/help.html.erb', type: :view do
  context 'when displaying requirements' do
    before do
      render
    end

    it 'Name' do
      expect(rendered)
        .to match(/Name should be up to 50 alphanumerical characters/)
    end

    it 'Last Name' do
      expect(rendered)
        .to match(/Last Name should be up to 50 alphanumerical characters/)
    end

    it 'Role' do
      expect(rendered)
        .to match(/One of : Admin, Project manager, HR manager or CEO/)
    end

    it 'Email' do
      expect(rendered).to match(/Email should look like : email@email.com/)
    end

    it 'Password' do
      expect(rendered).to match(/Password shouldn't be less than 8 characters/)
    end
  end
end
