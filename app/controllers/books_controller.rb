class BooksController < ApplicationController
  #before_action :authenticate_user!

  def new
    @book = BooksPrimaryContentInformation.new
    @book_contributor = BooksContributor.new
    @book_content_pricing = BooksContentPricing.new
    @book_content_access_rule  = BooksContentAccessRule.new
  end

  def create
    if params[:books_primary_content_information].present?
     @book = BooksPrimaryContentInformation.new(book_primary_content_information_params)
     @book.save!
     @form = "form1"
    elsif params[:book_contributers].present?
     book_contributers = JSON.parse(params[:book_contributers])
     book_contributers.each do |book_contributor_params|
        @book_contributor = BooksContributor.new(book_contributor_params)
        @book_contributor.save!
      end
     @form = "form2"
    elsif params[:book_content_pricing].present?
      @book_content_pricing = BooksContentPricing.new(books_content_pricing_params)
      @book_content_pricing.save!
      @form = "form3"
    elsif params[:book_content_access_rule].present?
     @book_content_access_rule = BooksContentAccessRule.new(book_content_access_rule_params)
     @book_content_access_rule.save!
     @form = "form4"
    end
  end

  # def search
  # end

  private
  def book_primary_content_information_params
    params.require(:books_primary_content_information).permit(:content_code, :publisher_id, :book_title, :subject_title, :isbn, :language, 
    :content_classification, :file_name, :stock_number, :publisher_site_sales_link, :book_blurb, :publication_date,
    :publication_month, :publication_year, :conversion_required, :edition, :binding, :volume, :dimension, :series_isbn,
    :series_title)
  end
  def book_contributor_params
    params.require(:books_contributor).permit(:contributor_role, :first_name, :description, :date_of_birth, :date_of_death, :professional_position, 
    :professional_affiliation, :website, :website_description)
  end
  def books_content_pricing_params
    params.require(:books_content_pricing).permit(:format, :isbn, :date_of_issue, :weight, :watermark_drm, 
    :external_drm)
  end
  def book_content_access_rule_params
    params.require(:book_content_access_rule).permit(:territorial_list_type, :territorial_list, :landing_page, :viewability_percentage, :exclude_pages_from_display, :total_free_pages_before_purchase, 
    :total_free_page_before_login, :exclude_pages_from_external_index, :actual_pages_indexable, :actual_browsable_pages, :actual_printable_pages, :actual_allowed_copying_pages, :internal_related_content)
  end
end

