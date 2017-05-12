class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = BooksPrimaryContentInfo.new
    @book_contributor = BooksContributor.new
    @book_seo_config  = BooksSeoConfig.new
  end

  def create
    if params[:books_primary_content_info].present?
     @book = BooksPrimaryContentInfo.new(book_primary_content_info_params)
     @book.save!
     @form = "form1"
    elsif params[:books_contributor].present?
     @book_contributor = BooksContributor.new(book_contributor_params)
     @book_contributor.save!
     @form = "form2"
    elsif params[:book_seo_config].present?
     @book_seo_config = BooksSeoConfig.new(book_seo_config_params)
     @book_seo_config.save!
     @form = "form4"
    else
      fghfgh
    end
    # if 
    
      #page << "$('#headingTwo').show();"
  end

  # def search
  # end

  private
  def book_primary_content_info_params
    params.require(:books_primary_content_info).permit(:content_code, :publisher, :title, :subject_title, :isbn, :language, 
    :content_classification, :file_name, :stock_number, :publisher_site_sales_link, :blurb, :publication_date,
    :publication_month, :publication_year, :conversion_required, :edition, :binding, :volume, :dimension, :series_isbn,
    :series_title)
  end
  def book_contributor_params
    params.require(:books_contributor).permit(:role, :name, :description, :doi, :dod, :professional_position, 
    :professional_affiliation, :website, :website_description)
  end
  def book_seo_config_params
    params.require(:book_seo_config).permit(:territorial_list_type, :territorial_list, :landing_page, :viewability_percentage, :exclude_pages_from_display, :total_free_pages_before_purchase, 
    :total_free_page_before_login, :exclude_pages_from_external_index, :actual_pages_indexable, :actual_browsable_pages, :actual_printable, :actual_allowed_copying_pages)
  end
end

