class RetailersController < ApplicationController
	def index
		# this is done because the association between
		# retailer and publisher association is through publisher's code.
		#here we get the retailers based on the publishers
		@retail = Retailer.pluck(:pub_id)
		#here we get all the publishers that are to be displayed in dropdown list of create page
		@publishers = Publisher.where(:pub_id => @retail).pluck(:pub_name)
	end 
	
	def new
		@retailer = Retailer.new
	end
	
	def create
		@retailer = Retailer.new(retailer_params)
		if @retailer.save
			redirect_to cs_retailers_path
		else
			render 'new'
		end
	end
	
	def search
		#store retailer's name and get the publisher that have same retailer name
		@pub = params[:retailer_name]
		@re = Publisher.where(:pub_name => @pub).first
		#sending the resulted variable into the partial so that the result get displayed
		render :partial => 'new', locals: { :re => @re }
	end

	private 
 
	def retailer_params
		params.require(:retailer).permit(:ret_code, :ret_name,	:pub_id, :low_IP,	:high_IP,	:IP_list, :operation)
	end
end	

