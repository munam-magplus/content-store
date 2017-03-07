class CsretailersController < ApplicationController
	def index
		@retailers = Retailer.all
		@retail = Retailer.pluck(:pub_id)
		@publishers = Publisher.where(:pub_id => @retail).pluck(:pub_name)
	end 
	
	def new
		byebug
		@retailer = Retailer.new
		# @retailer.retailerip = Retailerip.new
	end
	
	def create
		byebug
		@retailer = Retailer.new(retailer_params)
		# @retailer.build_retailerip
		if @retailer.save
			redirect_to cs_retailers_path
		else
			render 'new'
		end
	end
	
	def search
		@pub = params[:ret_name]
		@re = Publisher.where(:PUB_NAME => @pub).first
		render :partial => 'new', locals: { :re => @re }
	end

	private 
 
	def retailer_params
		byebug
		params.require(:retailer).permit(:ret_code, :ret_name, :pub_id,
										 :low_IP, :high_IP, :IP_list, :operation)
	end
end	

