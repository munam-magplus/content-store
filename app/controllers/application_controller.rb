class ApplicationController < ActionController::Base
  #protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?  
  private

  def after_sign_in_path_for(resource)
    dashboard_content_conversation_index_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
	
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
  end
end

end
