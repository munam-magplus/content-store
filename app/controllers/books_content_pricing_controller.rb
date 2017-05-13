class BooksContentPricingController < ApplicationController
  def new
    @book_content_pricing = BooksContentPricing.new
  end

  def create
    @book_content_pricing = BooksContentPricing.new(content_pricing_params)
    if @book_content_pricing.save!
      redirect_to books_content_access_rules_new_path
    else
      render 'new'
    end
  end

  private
  def content_pricing_params
    params.require(:books_content_pricing).permit(:format, :isbn, :doi, :weight, :watermark_drm, 
    :external_drm)
  end
end
