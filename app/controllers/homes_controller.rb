class HomesController < ApplicationController

  def index
  	gethost = request.host.split('.')[0] + '.' + 'com'
    @publisher = Publisher.find_by_domain_name(gethost)	
    # @books = @publisher.BooksPrimaryContentInformation
  end

end