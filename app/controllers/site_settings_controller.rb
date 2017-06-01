class SiteSettingsController < ApplicationController
	before_action :authenticate_user!

  def new
    @books_details = BooksPrimaryContentInformation.find_by_id(params[:format])
  end

	def create
	end

  def index
  end

	def books_of_publisher
	  publisher = params[:publisher_id]
	  @books_search = BooksPrimaryContentInformation.where(publisher_id: publisher)
	end

	def simple_search
	 @result = BooksPrimaryContentInformation.filter(params.slice(:isbn, :publisher_id))
	end

	def delete
	end
end
