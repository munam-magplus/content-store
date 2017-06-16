class ApplicationController < ActionController::Base
  #protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?  
  before_action :set_them
  private

  def after_sign_in_path_for(resource)
    # if current_user.admin?
    #   dashboard_content_conversations_path
    # else
    #   index_contents_content_code_path
    # end
    if resource.class.table_name == "users"
      dashboard_content_conversations_path
    else
      homes_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      new_user_session_path
    else
      homes_path
    end
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
