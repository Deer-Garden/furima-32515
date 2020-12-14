class ApplicationController < ActionController::Base
  
  before_action :configure_permmited_parameters, if: :devise_controller?

  private
  def configure_permmited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :fname, :lname, :email, :encrypted_password, :birthday])
  end
end
