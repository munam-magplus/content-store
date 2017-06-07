class ApplicationController < ActionController::Base
  #protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?  
  before_action :set_them
  private

  def after_sign_in_path_for(resource)
    dashboard_content_conversations_path
    # if current_user.admin?
    #   dashboard_content_conversations_path
    # else
    #   index_contents_content_code_path
    # end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def set_them
    if request.domain == "localhost"
      @css_root = "application" 
    elsif request.domain.present? && request.domain != 'www'
      @css_root = "#{request.domain}/application"
    end 
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
