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
	  @books_search = BooksPrimaryContentInformation.where(publisher_id: publisher).paginate(:page => params[:page], :per_page => 12)
	end

	def simple_search
		@result = BooksPrimaryContentInformation.filter(params.slice(:isbn, :publisher_id , :book_title)).paginate(:page => params[:page], :per_page => 10)
	end

	def delete
	end

	def homepage
    @homepage = Publisher.new
  end

  def new_homepage
    @homepage = Publisher.find(params[:id])
    respond_to do |format|
      format.js 
    end
  end

  def update_homepage
    @homepage = Publisher.find(params[:publisher][:id])
    if @homepage.update_attributes(homepage_params)
      redirect_to homepage_site_settings_path, notice: "The Homepage has been successfully updated."
    else
      render action: "edit"
    end
  end

  private
  def homepage_params
    params.require(:publisher).permit(:welcome_text, :news_and_events, :about, :terms_and_conditions, :policy)
  end
end