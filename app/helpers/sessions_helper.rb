module SessionsHelper

	# Logs in the given end_user.
	def log_in(end_user)
		session[:end_user_id] = end_user.id
	end

	# Returns the current logged-in end_user (if any).
  def current_end_user
    @current_end_user ||= EndUser.find_by(id: session[:end_user_id])
  end

  # Returns true if the end_user is logged in, false otherwise.
  def logged_in?
    !current_end_user.nil?
  end

  # Logs out the current end_user.
  def log_out
    session.delete(:end_user_id)
    @current_end_user = nil
  end
end
