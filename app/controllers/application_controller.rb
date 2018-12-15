# frozen_string_literal: true

# controls the app
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
end
