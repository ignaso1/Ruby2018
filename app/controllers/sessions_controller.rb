# frozen_string_literal: true

# controls session
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params.fetch(:session).fetch(:email))
    if user&.authenticate(params.fetch(:session).fetch(:password))
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
