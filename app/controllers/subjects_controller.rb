class SubjectsController < ApplicationController

  def index
  end

  def new
  	@subject = Subject.new
  end

  def create
  	@subject = Subject.new(subject_params)
  	if @subject.save
			redirect_to subjects_path
		else
			render 'new'
		end
  end

  def metadata_sheet
  end

  def import
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
      @subject = Subject.new
      @subject.attributes = row.to_hash.slice(*row.to_hash.keys)
      @subject.save!
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
    @subject = Subject.filter(params.slice(:publisher_id, :subject_name))
  end

  private
  def subject_params
  	params.require(:subject).permit(:publisher_id, :subject_name)
	end
end
