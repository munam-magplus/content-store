class PublishersController < ApplicationController
  def index
  end
  def show
  end
  def search
    #call filter method to get search results
    @publisher = Publisher.filter(params.slice(:PUB_CODE, :PUB_NAME))
  end
  def new
    @publisher = Publisher.new

  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save!
      # if successfully stored then redirect to publisher's setup path 
      redirect_to publisher_setup_index_path
    else
      # if not save then render same page
      render 'new'
    end
  end

  private 
  def publisher_params
    params.require(:publisher).permit(:pub_code, :pub_name, :pub_status, :pub_type, :end_user_lang, :manager_lang, :contact_first_name,
    :contact_last_name, :contact_email)
  end
end


