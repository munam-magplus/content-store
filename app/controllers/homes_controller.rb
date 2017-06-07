class HomesController < ApplicationController
	before_action :get_host
  def index
    unless @publisher.books_primary_content_informations.blank?
      @books = @publisher.books_primary_content_informations.paginate(:page => params[:page], :per_page => 12)
  	end
  end

  def contact_us
  end
 
  def about
  end

  def terms_and_conditions
  end

  def policy
  end

  def advance_search
  end
  
  def search
    @books = @publisher.books_primary_content_informations.filter(params.slice(:book_title))
    render "books_search_results", :object => @books
  end

  def books_description
    @book_information = BooksPrimaryContentInformation.find_by_id(params[:format])
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