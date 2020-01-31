# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authorize
    redirect_to signup_path unless user_signed_in?
  end
end
