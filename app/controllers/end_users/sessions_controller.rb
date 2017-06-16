class EndUsers::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if current_end_user.present?
       if (Publisher.find_by_id(current_end_user.publisher_id).domain_name) == (request.domain + ".com")
        super
      else
        flash[:alert] = "invalid username or password"
        sign_out :end_user
        redirect_to :back
      end
    else
      flash[:alert] = "invalid username or password"
      redirect_to :back
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
