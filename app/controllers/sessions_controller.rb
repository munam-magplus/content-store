class SessionsController < ApplicationController
  def new
  end

  def create
    end_user = EndUser.find_by(email: params[:session][:email].downcase)
    if end_user && end_user.authenticate(params[:session][:password])
    	log_in end_user
      redirect_to end_user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render :template => "shared/wtbooks/sign_in"
    end
  end

  def destroy
  end
end
