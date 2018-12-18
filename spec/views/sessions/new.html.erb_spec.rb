# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sessions/new.html.erb', type: :view do
  context 'when viewing input there is' do
    before do
      assign(:session, instance_double('Session', email: 'email@email.com',
                                                  password: 'password'))
      render
    end

    it 'email' do
      expect(rendered).to have_css('input[type="email"][name*="Email"]')
    end

    it 'password' do
      expect(rendered).to have_css('input[type="password"][name*="Password"]')
    end
  end
end
