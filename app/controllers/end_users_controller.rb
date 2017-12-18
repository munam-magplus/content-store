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

  # def metadata_sheet
  # end

  # def import
  #   #  In this method,we get the entire Excel file in params.
  #   # in params[:file], we get the path of the excel file.
  #   spreadsheet = open_spreadsheet(params[:file])
  #   header = spreadsheet.row(1)
  #   # we fetch first row elements( that act as column names of table) in header
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     # we get excel's row elements(that are attributes of table) in header
  #     # and in spreadsheet.row(i) we get data for record
  #     # here we transpose inorder to map each column and data for record insertion
  #     @subscriptionbooks = EndUser.new
  #     @subscriptionbooks.attributes = row.to_hash.slice(*row.to_hash.keys)
  #     @subscriptionbooks.save!
  #   end
  #   redirect_to :back
  # end

  
  
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