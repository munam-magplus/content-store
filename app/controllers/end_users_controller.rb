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

  def metadata_sheet
  end

  def import_for_end_users
    #  In this method,we get the entire Excel file in params.
    # in params[:file], we get the path of the excel file.
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    # we fetch first row elements( that act as column names of table) in header
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # we get excel's row elements(that are attributes of table) in header
      # and in spreadsheet.row(i) we get data for record
      # here we transpose inorder to map each column and data for record insertion
      @end_users = EndUser.new
      @end_users.attributes = row.to_hash.slice(*row.to_hash.keys)
      @end_users.save!
    end
    redirect_to :back
  end

  def open_spreadsheet(file)
     #  the details of Excel sheet are holded in file
    case File.extname(file.original_filename)
      # in file.original_filename, we get the name of the excel sheet.
      #  the File.extname is a method that is used to fetch the extension 
      # of file
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
     # in file.path,we get the path in which the excel sheet is stored
     # Roo:Spreadsheet.open(file.path, extension: :xls) helps us to open the 
     # Excel Spreadsheet
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
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