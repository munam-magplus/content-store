class CsRetaileripController < ApplicationController
  def new
  	@retailerip = CsRetailerip.new
  end

  def create
  	@retailerip = CsRetailerip.new(retailerip_params)
  	if @retailerip.save
  		redirect_to search_institution_index_path
  	else
  		render 'new'
  	end
  end
 	private
 	def retailerip_params
 		params.require(:retailerip).permit(:CRI_IP_AUTH_ID, :CRI_LOW_IP, :CRI_HIGH_IP, :CRI_IP_LIST, :CRI_RETAILER_CODE)
 	end
end
