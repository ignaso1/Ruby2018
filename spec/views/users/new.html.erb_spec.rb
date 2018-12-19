# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/new.html.erb', type: :view do
  context 'when viewing page there is a field to input' do
    before do
      assign(:user, create(:valid_user, :role_admin))
      render
    end

    # it 'name' do
    #   expect(rendered).to have_css('input[type="text"][name*="Name"]')
    # end

    # it 'last name' do
    #   expect(rendered).to have_css('input[type="text"][name*="LastName"]')
    # end

    # it 'email' do
    #   expect(rendered).to have_css('input[type="email"][name*="Email"]')
    # end

    # it 'role' do
    #   expect(rendered).to have_css('input[type="text"][name*="Role"]')
    # end

    # it 'password' do
    #   expect(rendered).to have_css('input[type="password"][name*="Password"]')
    # end

    # it 'password confirmation' do
    #   expect(rendered)
    #     .to have_css('input[type="password"][name*="PasswordConf"]')
    # end
  end
end
