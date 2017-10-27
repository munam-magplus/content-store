class SubjectGroupBooksController < ApplicationController
  def new
  	@associate_books = SubjectGroupBook.new
  end

  def index
  end

  def create
    if params[:book_id].any?
      book_ids = params[:book_id]
      book_ids.each do |book|
        @associate_books = SubjectGroupBook.new
        @associate_books.subject_group_id = params[:subject_group_id]
        @associate_books.books_primary_content_information_id = book
        @associate_books.save!
      end
      redirect_to new_subject_group_path
    end
  end  

  def unassociate_books
    if params[:book_id].any?
      book_ids = params[:book_id]
      book_ids.each do |book|
        SubjectGroupBook.new
        SubjectGroupBook.where(books_primary_content_information_id: book).where(subject_group_id: params[:subject_group_id]).delete_all
      end
      redirect_to new_subject_group_path
    end
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
      @subject = SubjectGroupBook.new
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

  def metadata_sheet
    
  end
end
