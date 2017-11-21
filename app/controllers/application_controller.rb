require 'ipaddr'
class ApplicationController < ActionController::Base
  before_filter :redirect_if_bolivia

  # helper_method :home_page

  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  include SessionsHelper
 
  private

  def after_sign_in_path_for(resource)
    dashboard_content_conversations_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

   def redirect_if_bolivia
    if bolivian_blocks.any? { |block| block.include?(request.remote_ip) }
      redirect_to welcome_index_path unless request.fullpath ==  welcome_index_path
    end
  end

  def bolivian_blocks
    IpAddress.all.map(&:low_ip).map{ |subnet| IPAddr.new subnet }
  end


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
