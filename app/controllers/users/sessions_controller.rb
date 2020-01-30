# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include Devise::Controllers::Rememberable
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.valid_password?(params[:session][:password])
      sign_in(@user)
      remember_me current_user if params[:session][:remember_me] == '1'
      redirect_to root_path
    else
      flash.now[:notice] = "Wrong email or password for login"
      @user = User.new
      render 'devise/registrations/new'
    end
   end

  # DELETE /resource/sign_out
  def destroy
     sign_out(current_user)
     redirect_to root_path
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:session) do |u|
      u.permit(:email, :password, :remember_me)
    end
  end
end
