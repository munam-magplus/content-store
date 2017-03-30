class BooksController < ApplicationController
	def new
  	@book = BooksPrimaryContentInfo.new
    @book_contributor = BooksContributor.new
    @book_content = BooksContentPricing.new
    @book_seo = BooksSeoConfig.new
	end

  def create
    @book = BooksPrimaryContentInfo.new(primary_content_info_params)
  	if @book.save!
      redirect_to contributors_new_books_path
  	else
  	render 'new'
    end
  end

  def create_contributors
    @book_contributor = BooksContributor.new(contributors_params)
    if @book.save!
      redirect_to new_books_contributors_path
    else
    render 'new'
    end
  end

  def create_content_pricing
    @book_content = BooksContentPricing.new(content_pricing_params)
    if @book.save!
      redirect_to new_books_contributors_path
    else
    render 'new'
    end
  end

  def create_seo_config
    @book_seo = BooksSeoConfig.new(seo_config_params)
    if @book.save!
      redirect_to new_books_contributors_path
    else
    render 'new'
    end
  end

  def create_hello
  	@book = BooksPrimaryContentInfo.new()
  	if @book.save
			redirect_to book_path
		else
			render 'new'
		end
  end

  def search
  end

  private
  def primary_content_info_params
  	params.require(:primarycontentinfo).permit(:content_code, :publisher, 
  	:title, :subject_title, :isbn, :language, :content_classification, :file_name, 
    :stock_number, :publisher_site_sales_link, :blurb, :publisher_date, 
    :publisher_month, :publisher_year, :conversion_required, :edition,
    :binding, :volume, :series_ISBN, :series_title, :dimension)
	end

	def contributors_params
  	params.require(:contributors).permit(:role, :name, 
  	:description, :doi, :dod, :professional_position,
		:professional_affiliation, :website, :website_description)
	end

	def content_pricing_params
  	params.require(:contentpricing).permit(:format, :isbn, 
  	:doi, :weight, :watermarked_drm, :external_drm)
	end

	def seo_config_params
  	params.require(:seoconfig).permit(:territorial_list_type, :territorial_list, 
  	:landing_page, :viewability_percentage, :exclude_pages_from_display, 
    :total_free_pages_before_purchase, :total_free_pages_before_login, 
    :exclude_pages_from_external_index, :actual_pages_indexable, 
    :actual_browsable_pages, :actual_printable, :actual_allowed_copying_pages, 
    :internal_related_content, :related_content_identifier, :related_content_name, 
    :related_content_url, :subject_group, :number_of_page, :free_matter, 
    :first_page_of_full_text, :last_page_of_full_text)
	end
end

