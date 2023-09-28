class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_admin?
    unless current_user.has_role? :admin
      flash[:danger]="you dont have access to this action" 
    end
  end

  def is_logged_in?
    redirect_to new_user_session_path unless user_signed_in?
  end

  protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit( :username, :email, :password, :address ) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :address ) }
    end
end
