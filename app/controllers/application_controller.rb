class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def require_admin
    unless current_user_admin?
      sign_out current_user
      redirect_to new_user_session_path, alert: "Must be Admin to access this area"
    end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end
  helper_method :current_user_admin?
end
