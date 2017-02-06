class RetailersController < ApplicationController
	
	def index
		#@retailers = Retailer.get_retailer_names
	end 
	def search
		render :partial => 'new'
	end
end