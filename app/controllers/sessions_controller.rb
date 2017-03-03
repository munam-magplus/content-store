class SessionsController < ApplicationController
  def new
  end

  def create
  	if cdp_user = CdpUser.find_by(USE_EMAIL: params[:session][:USE_EMAIL].downcase)
   		if cdp_user = CdpUser.find_by(USE_USER_PASS: params[:session][:USE_USER_PASS])
	    	sign_in cdp_user
	    	redirect_to content_conversation_index_url
	      # Sign the user in and redirect to the user's show page.
	    else
	      flash[:message] = 'Invalid password '
	      render 'new'
	    end
	  else
      flash[:error] = 'Invalid email '
      render 'new'
    end
  end

  def message
  end
  
  def destroy
  	sign_out
    redirect_to root_url
  end
end
