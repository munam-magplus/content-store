class HomesController < ApplicationController
	before_action :get_host
  def index
    unless @publisher.books_primary_content_informations.blank?
      @books = @publisher.books_primary_content_informations
  	end
  end

  def contact_us
  end
 
  def search
   	if params[:book_title] == ""
  		flash[:alert] = "Sorry - no search terms were entered. Please enter your search terms and try again."
 		else 		
   	 @result = BooksPrimaryContentInformation.where(:book_title => params[:book_title])
  	end
  end

  def books_description
    @book_information = BooksPrimaryContentInformation.find_by_id(params[:format])
	  if @publisher.domain_name == "wutheringink.com"
	  	render 'wutheringink_books_description'
	  else
	  	render 'wtbooks_books_description'
	  end
  end

  def books_by_category
    subject_group = SubjectGroup.find(params[:subject_group_id])
    @books_by_subject_group = subject_group.subject_group_books   
  end
  private
	
	def get_host
 	  @gethost = request.host.split('.')[0] + '.' + 'com'
    @publisher = Publisher.find_by_domain_name(@gethost)
   end
end