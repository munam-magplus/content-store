class BooksController < ApplicationController
  def new
    @book = BooksPrimaryContentInfo.new
  end

  def create
    @book = BooksPrimaryContentInfo.new(primary_content_info_params)
    if @book.save!
      redirect_to new_book_path
    else
      render 'new'
    end
  end

  def search
  end

  private
  def primary_content_info_params
  	params.require(:primary_content_info).permit(:content_code, 
    :publisher, :title, :subject_title, :isbn, :language, 
    :content_classification, :file_name, :stock_number, 
    :publisher_site_sales_link, :blurb, :publisher_date, 
    :publisher_month, :publisher_year, :conversion_required, 
    :edition, :binding, :volume, :dimension, :series_isbn, 
    :series_title)
	end
end

