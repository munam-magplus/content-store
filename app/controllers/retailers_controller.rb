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
		# @retailers = Retailer.all
		# @retail = Retailer.find_by(params[:id])
		# @ret = @retail.publisher_id
		# @re = Publisher.find_by(@ret)
		@retailer = Retailer.new(retailer_params)
		if @retailer.save!
			# render 'search',locals: { :re => @re }
			# redirect_to institution_account_index_path
			flash[:success] = "retailer created"
			redirect_to :back		
		else
			render 'new'
		end
		if @retailer.present?
			session[:expires_at] = Time.current + 1.minute
			session[:retailer_code] = @retailer.retailer_code
			session[:retailer_name] = @retailer.retailer_name
			session[:publisher_id] = @retailer.publisher_id
			session[:low_ip] = @retailer.low_ip
			session[:high_ip] = @retailer.high_ip
			session[:ip_list] = @retailer.ip_list
			session[:id] = @retailer.id
						byebug
		end
	end
	
	def search
	  #get the publisher that have same retailer name
	  # @retailers = Retailer.last
	  session[:expires_at] = Time.current + 1.minute
	  @re = Publisher.find_by_publisher_name(params[:retailer_name])
	  respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def show
		byebug
	end

	def destroy
		byebug
		# @retailers = Retailer.all
		# @retailer = Retailer.find_by(params[:id])
		# @ret = @retailer.publisher_id
		# @re = Publisher.find_by(@ret)
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

