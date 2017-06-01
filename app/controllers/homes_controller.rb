class HomesController < ApplicationController
	before_action :get_host
  def index
    # @books = @publisher.BooksPrimaryContentInformation
    unless @publisher.books_primary_content_informations.blank?
     @books = @publisher.books_primary_content_informations
  	end
  end

  def contact_us
  end

  def search
   	@result = BooksPrimaryContentInformation.filter(params.slice(:book_title))
  end

  private
  	def get_host
   	  gethost = request.host.split('.')[0] + '.' + 'com'
      @publisher = Publisher.find_by_domain_name(gethost)
    end

end