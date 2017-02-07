class RetailersController < ApplicationController
	
	def index
		@retail = Retailer.pluck(:PUB_PUBLISHER_ID)
		@publishers = Publisher.where(:PUB_PUBLISHER_ID => @retail).pluck(:PUB_NAME)
	end 
	
	def new
		byebug
		@retailer = Retailer.new
	end
	
	def create
		byebug
		@retailer = Retailer.new(retailer_params)
		if @retailer.save
			redirect_to retailers_path
		else
			render 'new'
		end
	end
	
	def search
		render :partial => 'new'
	end

	private 
 
	def retailer_params
		params.require(:CDP_RETAILER).permit(:RETAILER_CODE, :REATILER_NAME, :PUB_PUBLISHER_ID,
										:REFERRAL_URL, :RETAILER_IP_RANGE, :RETAILER_STATUS_CD, :RETAILER_CONFIG_PATH,
										:RETAILER_SALES_LINK)
	end
end