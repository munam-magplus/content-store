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
      begin
        @gethost = request.host.split('.')[0]
        @publisher = Publisher.find_by_domain_name!(@gethost)
        unless @publisher.blank?
          unless @publisher.theme_name.blank?
            @css_root = "#{request.domain}/#{@publisher.theme_name}/application"
          else
            @css_root = "#{request.domain}/default_theme/application"
          end  
        else 
          @css_root = "application"
        end
      rescue ActiveRecord::RecordNotFound
        redirect_to users_sign_in_path
      end
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
