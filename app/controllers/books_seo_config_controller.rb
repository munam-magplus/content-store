class BooksSeoConfigController < ApplicationController
  def new
    @book_seo_config = BooksSeoConfig.new
  end

  def create
    @book_seo_config = BooksSeoConfig.new(primary_content_info_params)
    if @book_seo_config.save!
      redirect_to books_contributors_path
    else
      render 'new'
    end
  end
end
