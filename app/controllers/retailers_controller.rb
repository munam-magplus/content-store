class RetailersController < ApplicationController
	before_action :authenticate_user!
 	def index
  	 #here we get all the publishers that are to be displayed in dropdown list of create page
	  @publishers = Publisher.all.pluck(:publisher_name)
	end 
	
	def new
  	  @publisher = Publisher.find_by_publisher_name(params[:publisher_name])		
		@retailer = Retailer.new
	end
	
	def create
 		@retailer = Retailer.new(retailer_params)
		if @retailer.save!
 			flash[:success] = "retailer created"
			# redirect_to result_retailers_path		
			respond_to do |format|
  			format.js
			end
		else
			render 'new'
		end
	end
	
	def result
 		@retailers = Retailer.filter(params.slice(:publisher_id , :retailer_name,
								:retailer_code	))
		respond_to do |format|
  			format.js
			end
	end

	def search 
  
	end

	def show
 	end

 	def edit
  		@retailer = Retailer.find_by_id(params[:id])
 	end

 	def update
  		@retailer = Retailer.find_by_id(params[:id])
 		if @retailer.update 
 			redirect_to 'index'
 		else
 			render 'new'
 		end
 	end

	def destroy
		@retailer = Retailer.find_by_id(params[:id])
		@retailer.destroy
		redirect_to :back
	end

	private 
 
	def retailer_params
 		params.require(:retailer).permit(:retailer_code, :retailer_name,	
			:publisher_id, :low_ip,	:high_ip,	:ip_list)
	end
end	

