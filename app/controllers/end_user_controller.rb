class EndUserController < ApplicationController
  def search
    #Call filter method to get search results
  	@end_user = EndUser.filter(params.slice(:publisher, :email, :last_name, :country, :license_id))
  end

  def new
  	@end_user = EndUser.new
  end

  def create
  	@end_user = EndUser.new(end_user_params)
		if @end_user.save!
			# If successfully stored then redirect to  setup path 
    	redirect_to end_user_new_path
  	else
    	# If not save in that case render new
    	render 'new'  			
		end
	end

  def search_result
    @end_user = EndUser.search(params[:pub_id], params[:name], params[:code], params[:lang_id])
    render :partial => 'search_result'
  end
  
  private 
  def end_user_params
    params.require(:end_user).permit(:publisher, :email, 
    :confirm_email, :password, :confirm_password, :first_name, 
    :last_name, :country)
  end
end