class HomesController < ApplicationController
  before_action :get_host
  def index
    begin
    unless @publisher.books_primary_content_informations.blank?
      @books = @publisher.books_primary_content_informations.paginate(:page => params[:page], :per_page => 2)
    end
  rescue => e # catches StandardError (don't use rescue Esception => e)
   logger.error e.message
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
    @book_information = BooksPrimaryContentInformation.find(params[:book_id])
    respond_to do |format|
      format.js
    end 
  end

  def books_by_category
    subject_group = SubjectGroup.find(params[:subject_group_id])
    @books = subject_group.books_primary_content_informations.paginate(:page => params[:page], :per_page => 1)
    respond_to do |format|
      format.js
    end  
      
  end

  private
  
  def get_host
    begin
      @gethost = request.host.split('.')[0] + '.' + 'com'
      @publisher = Publisher.find_by_domain_name(@gethost)
    rescue => e # catches StandardError (don't use rescue Esception => e)
     logger.error e.message
    end
  end
end