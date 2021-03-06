# frozen_string_literal: true

# controls users
class UsersController < ApplicationController
  def show
    @user = User.find(params.key?(:id))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation,
                                 :name, :last_name, :role)
  end
end
