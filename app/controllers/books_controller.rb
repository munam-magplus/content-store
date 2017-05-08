class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = BooksPrimaryContentInfo.new
    @book_contributor = BooksContributor.new
  end

  def create
    @book = BooksPrimaryContentInfo.new(primary_content_info_params)
    if @book.save!
      redirect_to institution_admin_user_index_path
    else
      render 'new'
    end
  end

  def search
  end

  private
  def primary_content_info_params
    params.require(:books_primary_content_info).permit(:content_code, :publisher, :title, :subject_title, :isbn, :language, 
    :content_classification, :file_name, :stock_number, :publisher_site_sales_link, :blurb, :publication_date,
    :publication_month, :publication_year, :conversion_required, :edition, :binding, :volume, :dimension, :series_isbn,
    :series_title)
  end
end

