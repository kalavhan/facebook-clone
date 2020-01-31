# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :authorize, only: [:show]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
    @user = current_user
  end

  def show
    # redirect_to signup_path unless user_signed_in?
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
  end

  # PUT /resource
  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up) do |u|
    u.permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
  end

  def user_params
    params[:user].permit(:first_name, :last_name, :gender, :link_image, :location, :date_of_birth, :status, :bio)
  end

  def user_signed_in?
    super
  end
end
