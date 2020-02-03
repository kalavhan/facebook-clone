# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LikesHelper
  
  def authorize
    redirect_to signup_path unless user_signed_in?
  end
end
