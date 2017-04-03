class RetailersController < ApplicationController
	def index
		# this is done because the association between
		# retailer and publisher association is through publisher's code.
		#here we get the retailers based on the publishers
		 # @retail = Retailer.pluck(:publisher_id)
		 #here we get all the publishers that are to be displayed in dropdown list of create page
		 # @publishers = Publisher.where(:id => @retail).pluck(:publisher_name)
		 @publishers = Publisher.all.pluck(:publisher_name)
		 respond_to do |format|
		  	format.html
		  	format.js
	   end
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
	  #get the publisher that have same retailer name
	  @retailer = Retailer.last
	  @re = Publisher.find_by_publisher_name(params[:retailer_name])
	  respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def show
		
	end

	def destroy
		byebug
		@retailer.destroy
		redirect_to new_institution_account_path
	end

	private 
 
	def retailer_params
		params.require(:retailer).permit(:retailer_code, :retailer_name,	
			:publisher_id, :low_ip,	:high_ip,	:ip_list)
	end
end	

