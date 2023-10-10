class ApplicationController < ActionController::Base
  include ApplicationHelper

  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :address) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :current_password, :address)
    end
  end

  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
