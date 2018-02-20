class BooksController < ApplicationController
  #before_action :authenticate_user!

  def new
    @book = BooksPrimaryContentInformation.new
    @book_contributor = BooksContributor.new
    @book_content_pricing = BooksContentPricing.new
    @book_content_access_rule  = BooksContentAccessRule.new
  end

  def edit
    @book = BooksPrimaryContentInformation.find(params[:id])
    @book_contributor = BooksContributor.find_by_books_primary_content_information_id(params[:id])
    @book_content_pricing = BooksContentPricing.new
    @book_content_access_rule  = BooksContentAccessRule.new
    render 'new'
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
      @book = BooksPrimaryContentInformation.new
      @book.attributes = row.to_hash.slice(*row.to_hash.keys)
      if @book.id.present?
       @books = BooksPrimaryContentInformation.find(@book.id)
       @books.update_attributes!(@book.attributes)
      else
       @book.save!
      end
    end
    redirect_to :back
  end

  def import_chapter_details
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      @book = Isbnchapterdetail.new
      @book.attributes = row.to_hash.slice(*row.to_hash.keys)
      @book.save!
    end
    redirect_to :back
  end

  def import_contributor
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
       @book = BooksContributor.new
      @book.attributes = row.to_hash.slice(*row.to_hash.keys)
      if @book.id.present?
       @books = BooksContributor.find(@book.id)
       @books.update_attributes!(@book.attributes)
      else
       @book.save!
      end
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

  def metadata_sheet_for_books_primary_information
  end

  def metadata_sheet_for_books_contributor
  end

  def update
    @book = BooksPrimaryContentInformation.find(params[:books_primary_content_information][:id])
    @book.update_attributes!(book_primary_content_information_params)
    @form = "form1"
  end

  def save
    if params[:books_primary_content_information].present?
      @book = BooksPrimaryContentInformation.new(book_primary_content_information_params)
      @book.save!
      # To save books_primary_content_information values
      @form = "form1"# just to move on next form.
    elsif params[:book_contributers].present?   
    # To save book_contributers valuese
     book_contributers = JSON.parse(params[:book_contributers])
     book_contributers.each do |book_contributor_params|
      # To save multiple records
        if book_contributor_params["id"].present?
          @book_contributor = BooksContributor.find(book_contributor_params["id"])
          @book_contributor.update_attributes!(book_contributor_params)
        else
          @book_contributor = BooksContributor.new(book_contributor_params)
          primary_id = BooksPrimaryContentInformation.last[:id]
          @book_contributor.books_primary_content_information_id = primary_id
          @book_contributor.save!
        end
      end
     @form = "form2"  # just to move on next form. 
     respond_to { |format| format.js }
    elsif params[:books_content_pricing].present?
      # To save books_content_pricing values
      book_content_pricing = JSON.parse(params[:books_content_pricing])
      book_content_pricing.each do |books_content_pricing_params|
        # To save multiple records
        @book_content_pricing = BooksContentPricing.new(books_content_pricing_params)
        primary_id = BooksPrimaryContentInformation.last[:id]
        @book_content_pricing.books_primary_content_information_id = primary_id
        @book_content_pricing.save!
      end
      @form = "form3" # just to move on next form. 
      respond_to { |format| format.js } 
    elsif params[:book_content_access_rule].present?
      # To save book_content_access_rule values
     @book_content_access_rule = BooksContentAccessRule.new(book_content_access_rule_params)
     primary_id = BooksPrimaryContentInformation.last[:id]
     @book_content_access_rule.books_primary_content_information_id = primary_id
     @book_content_access_rule.save!
     @form = "form4" # just to move on next form. 
    end
  end

  def search
    #Call filter method to get search results
    @books = BooksPrimaryContentInformation.filter(params.slice(:publisher_id, :isbn, :title)).paginate(:page => params[:page], :per_page => 10)
  end

  def destroy
    book = BooksPrimaryContentInformation.find(params[:id])
    book.destroy
    redirect_to :back
  end

  private

  def book_primary_content_information_params
    params.require(:books_primary_content_information).permit(:content_code, :publisher_id, :book_title, :subject_title, :isbn, :language, 
    :content_classification, :file_name, :stock_number, :publisher_site_sales_link, :book_blurb, :publication_date,
    :conversion_required, :edition, :binding, :volume, :dimension, :series_isbn,
    :series_title, :logo, :license_id, :number_of_pages, :book_price, :status)
  end

  def book_contributor_params
    params.require(:books_contributor).permit(:contributor_role, :first_name, :description, :date_of_birth, :date_of_death, :professional_position, 
    :professional_affiliation, :website, :website_description,:books_primary_content_information_id)
  end

  def books_content_pricing_params
    params.require(:books_content_pricing).permit(:format, :format_isbn, :date_of_issue, :weight, :watermark_drm, 
    :external_drm,:books_primary_content_information_id,:books_primary_content_information_id)
  end
  
  def book_content_access_rule_params
    params.require(:book_content_access_rule).permit(:territorial_list_type, :territorial_list, :landing_page, :viewability_percentage, :exclude_pages_from_display, :total_free_pages_before_purchase, 
    :total_free_page_before_login, :exclude_pages_from_external_index, :actual_pages_indexable, :actual_browsable_pages, :actual_printable_pages, :actual_allowed_copying_pages, :internal_related_content)
  end
end

