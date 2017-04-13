class RetailersController < ApplicationController
	    before_action :authenticate_user!

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
		@retailer = Retailer.new
	end
	
	def create
		@retailers = Retailer.all
		@retail = Retailer.find_by(params[:id])
		@ret = @retail.publisher_id
		@re = Publisher.find_by(@ret)
		@retailer = Retailer.new(retailer_params)
		if @retailer.save
			render 'search',locals: { :re => @re }
		else
			render 'new'
		end
	end
	
	def search
	  #get the publisher that have same retailer name
	  @retailers = Retailer.all
	  @re = Publisher.find_by_publisher_name(params[:retailer_name])
	  respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def show
	end

	def destroy
		@retailers = Retailer.all
		@retailer = Retailer.find_by(params[:id])
		@ret = @retailer.publisher_id
		@re = Publisher.find_by(@ret)
		@retailer.destroy
		respond_to do |format|
      format.html { render 'search',locals: { :re => @re }}
      format.json { head :no_content }
    end
	end

	private 
 
	def retailer_params
		params.require(:retailer).permit(:retailer_code, :retailer_name,	
			:publisher_id, :low_ip,	:high_ip,	:ip_list)
	end
end	

