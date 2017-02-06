class PublishersController < ApplicationController
  def index
  end

  def show
  end
  def search
    #@publisher = Publisher.find_by_user_id_and_project_id(params[:user_id],params[:project_id])
    render :partial => 'search_result'
  end
  def new
    @publisher = Publisher.new
  end

  def create
  end 
end
