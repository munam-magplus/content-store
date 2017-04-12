class PromoCodesController < ApplicationController
  def search
  	#call filter method to get search results
  	@promo_codes = PromoCode.filter(params.slice(:publisher_id, :campaign_id, :id))
  end

  def create
    @campaign = PromoCode.create!(promo_code_params)
    flash[:success] = "PromoCode Created!"
  end

  def new
    @promo_codes = PromoCode.new
  end

  def index
  end
  private 
  def promo_code_params
    params.require(:promo_code).permit(:publisher_id, :campaign_id, 
    :number_of_promo_code, :applicable_discount, :from, :to)
  end
end