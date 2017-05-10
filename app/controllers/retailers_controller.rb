class RetailersController < ApplicationController
	before_action :authenticate_user!
	# @@count = 0
	def index
  	 #here we get all the publishers that are to be displayed in dropdown list of create page
	  @publishers = Publisher.all.pluck(:publisher_name)
	end 
	
	def new
		@retailer = Retailer.new
	end
	
	def create
 		@retailer = Retailer.new(retailer_params)
		if @retailer.save!
			# @@count += 1
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
	end

	def search_op
		# @@count = 0
  	  #get the publisher that have same retailer name
 	  @re = Publisher.find_by_publisher_name(params[:retailer_name])
	end

	def show
 	end

	def destroy
		@retailer = Retailer.find_by_id(session[:id])
		@retailer.destroy
		redirect_to :back
	end

	private 
 
	def retailer_params
 		params.require(:retailer).permit(:retailer_code, :retailer_name,	
			:publisher_id, :low_ip,	:high_ip,	:ip_list)
	end
end	

