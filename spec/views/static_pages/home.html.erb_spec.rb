# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'static_pages/home.html.erb', type: :view do
  context 'when logged in' do
    before do
      allow(view).to receive(:logged_in?).and_return(true) # Mock
    end

    it 'links to profile if logged in' do
      render
      expect(rendered).to match /Profile/
    end
  end

  context 'when not logged in' do
    before do
      allow(view).to receive(:logged_in?).and_return(false) # Mock
    end

    it 'links to sign up' do
      render
      expect(rendered).to match /Sign up/
    end
  end
end 
