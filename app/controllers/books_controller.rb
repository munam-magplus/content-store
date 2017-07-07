class BooksController < ApplicationController
  #before_action :authenticate_user!

  def new
     @book = BooksPrimaryContentInformation.new
    @book_contributor = BooksContributor.new
    @book_content_pricing = BooksContentPricing.new
    @book_content_access_rule  = BooksContentAccessRule.new
  end

  def import
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      @book = BooksPrimaryContentInformation.new
      @book.attributes = row.to_hash.slice(*row.to_hash.keys)
      @book.save!
    end
    redirect_to :back
  end

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls) 
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def metadata_sheet
  end

  def create
    if params[:books_primary_content_information].present?
    # To save books_primary_content_information values
     @book = BooksPrimaryContentInformation.new(book_primary_content_information_params)
     @book.save!
     @form = "form1"# just to move on next form.
    elsif params[:book_contributers].present? 
    # To save book_contributers values
     book_contributers = JSON.parse(params[:book_contributers])
     book_contributers.each do |book_contributor_params|
      # To save multiple records
        @book_contributor = BooksContributor.new(book_contributor_params)
        primary_id = BooksPrimaryContentInformation.last[:id]
        @book_contributor.books_primary_content_information_id = primary_id
        @book_contributor.save!
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
    :series_title, :logo, :license_id)
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

