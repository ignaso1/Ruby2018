# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:user) { create(:valid_user, :role_admin) }

    def valid_log_in
      post :create, params: { session: { email: 'johndoe@example.com',
                                         password: 'valid_password' } }
    end

    def invalid_log_in
      post :create, params: { session: { email: 'johndoe@example.com',
                                         password: 'word' } }
    end

    context 'when params are invalid' do
      it 'renders new with invalid params' do
        invalid_log_in
        expect(response).to render_template(:new)
      end
    end

    context 'when params are valid' do
      def authenticate
        expect(User).to receive(:find_by)
          .with(email: 'johndoe@example.com')
          .and_return(user) # Mock
      end

      it 'redirects to user with correct params' do
        authenticate
        valid_log_in
        expect(response).to redirect_to(user)
      end

      it 'logs in with valid params' do
        authenticate
        valid_log_in
        expect(session[:user_id]).to eq(user.id)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:valid_user, :role_admin) }

    it 'clears the session' do
      session[:user_id] = user.id
      expect { delete :destroy }
        .to change { session[:user_id] }.to(nil)
    end

    it 'redirects to the home page' do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
