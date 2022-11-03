class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_params, if: :devise_controller?

  before_action :authenticate_user!

  private

  def update_allowed_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio, :post_counter, :email, :password, :password_confirmation])
  end
end
