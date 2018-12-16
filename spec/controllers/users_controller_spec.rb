# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'creates a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    let(:subject) { post :create, params: { user: attributes_for(:valid_user, :role_admin) } }

    let(:user) { create(:valid_user, :role_admin) }

    it 'creates a user with valid parameters' do
      expect { subject }.to change(User, :count).by(1)
    end

    it 'redirects to user valid parameters' do
      subject
      expect(response).to redirect_to(action: :show, id: assigns(:user).id)
    end

    it 'does not create a user with invalid parameters' do
      expect { post :create, params: { user: attributes_for(:invalid_user) } }
        .not_to change(User, :count)
    end

    it 'renders template new with invalid parameters' do
      post :create, params: { user: attributes_for(:invalid_user) }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    let(:user) { create(:valid_user, :role_admin) }

    it 'returns http success' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end
end
