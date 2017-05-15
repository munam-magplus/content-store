class BooksController < ApplicationController
  #before_action :authenticate_user!

  def new
    @book = BooksPrimaryContentInfo.new
    @book_contributor = BooksContributor.new
    @book_seo_config  = BooksSeoConfig.new
    @book_content_pricing = BooksContentPricing.new
  end

  def create
    if params[:books_primary_content_info].present?
     @book = BooksPrimaryContentInfo.new(book_primary_content_info_params)
     @book.save!
     @form = "form1"
    elsif params[:book_contributers].present?
     book_contributers = JSON.parse(params[:book_contributers])
     book_contributers.each do |book_contributor_params|
        @book_contributor = BooksContributor.new(book_contributor_params)
        @book_contributor.save!
      end
     @form = "form2"
    elsif params[:book_seo_config].present?
     @book_seo_config = BooksSeoConfig.new(book_seo_config_params)
     @book_seo_config.save!
     @form = "form4"
    else
      @book_content_pricing = BooksContentPricing.new(books_content_pricing_params)
      @book_content_pricing.save!
      @form = "form3"
    end
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
  def books_content_pricing_params
    params.require(:books_content_pricing).permit(:format, :isbn, :doi, :weight, :watermark_drm, 
    :external_drm)
  end
  def book_seo_config_params
    params.require(:book_seo_config).permit(:territorial_list_type, :territorial_list, :landing_page, :viewability_percentage, :exclude_pages_from_display, :total_free_pages_before_purchase, 
    :total_free_page_before_login, :exclude_pages_from_external_index, :actual_pages_indexable, :actual_browsable_pages, :actual_printable, :actual_allowed_copying_pages)
  end
end

