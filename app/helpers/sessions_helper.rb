module SessionsHelper

	# Logs in the given end_user.
	def log_in(end_user)
		session[:end_user_id] = end_user.id
	end

  def log_in_ip(end_user)
    session[:institution_account_id] = end_user.institution_account_id
    session[:end_user_ip_id] = end_user.low_ip
    redirect_to root_path(id: end_user.institution_account_id)  unless request.fullpath == root_path(id: end_user.institution_account_id)
  end

	# Returns the current logged-in end_user (if any).
  def current_end_user
    @current_end_user ||= EndUser.find_by(id: session[:end_user_id])
  end

  def current_end_user_ip
    @current_end_user_ip ||= IpAddress.find_by(low_ip: session[:end_user_ip_id])
  end

  # Returns true if the end_user is logged in, false otherwise.
  def logged_in?
    !current_end_user.nil?
  end

  def ip_logged_in?
    !current_end_user_ip.nil?
    #@institute_name = InstitutionAccount.find_by_id(params[:institution_id]).institution_name
  end

  # Logs out the current end_user.
  def log_out
    session.delete(:end_user_id)
    @current_end_user = nil
  end
end
