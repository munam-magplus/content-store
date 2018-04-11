class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_publisher_name
  #before_action :set_publisher_theme
  before_action :configure_permitted_parameters, if: :devise_controller?
  include SessionsHelper
 
  private

  def set_publisher_name
    publisher_domain = request.host
    @publisher_name = publisher_domain.split('.')[1]
  end

  def after_sign_in_path_for(resource)
    dashboard_content_conversations_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # def set_publisher_theme
  #   byebug
  #   unless request.domain == "wtbooks.com" 
  #     @publisher_logo =  Publisher.where(domain_name: request.domain).last.publisher_logo_file_name
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
	
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email, :admin)
    end
  end
end
