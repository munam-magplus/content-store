class EndUsersController < ApplicationController
    before_action :authenticate_user!

  def new
  	@end_user = EndUser.new
  end

  def create
  	@end_user = EndUser.new(end_user_params)
		if @end_user.save!
      flash[:success] = "End User Created!"
			# If successfully stored then redirect to  setup path 
    	redirect_to end_users_path
  	else
    	# If not save in that case render new
    	render 'new'  			
		end
	end

  def index
  end
  
  def search
    #Call filter method to get search results
    @end_user = EndUser.filter(params.slice(:publisher_id, :email, :last_name, :country_code))
  end
  
  private 
  def end_user_params
    params.require(:end_user).permit(:publisher_id, :email, 
    :password, :first_name, :last_name, :country_code)
  end
end