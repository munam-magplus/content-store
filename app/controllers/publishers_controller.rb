class PublishersController < ApplicationController
      before_action :authenticate_user!

  def index
  end

  def search
    #call filter method to get search results
    @publisher = Publisher.filter(params.slice(:publisher_code, :publisher_name))
  end

  def edit   
    @publisher = Publisher.find(params[:id])
    render 'new'
  end
  
  def new
    @publisher = Publisher.new
  end

  def save
    if params[:publisher][:id] != ""
      @publisher = Publisher.find(params[:publisher][:id])
      if @publisher.update_attributes!(publisher_params)
      # Handle a successful update.
        flash[:notice] = 'Publisher was successfully updated.'
        redirect_to publishers_path
      else
        render 'edit'
      end
    else
      @publisher = Publisher.new(publisher_params)  
      if @publisher.save!
        flash[:success] = "Publisher Created!"
        # if successfully stored then redirect to publisher's setup path 
        redirect_to publishers_path
      else
        # if not save in that case render new
        render 'new'
      end
    end
  end
  
  private 
  def publisher_params
    params.require(:publisher).permit(:publisher_code, :publisher_name, 
    :publisher_status, :publisher_type, :end_user_language, :manager_language,
    :contact_first_name, :contact_last_name, :contact_email,:country_code)
  end
end