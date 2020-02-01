# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :authorize, only: [:show]

  def new
    super
  end

  def create
    super
  end

  def edit
    super
    @user = current_user
  end

  def show
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
  end

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
    params[:user].permit(:first_name, :last_name, :gender, :link_image,
                         :location, :date_of_birth, :status, :bio)
  end

  def user_signed_in?
    super
  end
end
