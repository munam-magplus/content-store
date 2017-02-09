class PublishersController < ApplicationController
  def index
  end
  def show
  end
  def search
    @publisher = Publisher.search(params[:code], params[:name])
    render :partial => 'search_result'
  end
  def new
    @publisher = Publisher.new
  end

  def create
  end 
end
