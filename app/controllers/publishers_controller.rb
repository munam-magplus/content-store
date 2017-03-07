class PublishersController < ApplicationController
  def index
  end
  def show
  end
  def search
    @publisher = Publisher.filter(params.slice(:pub_code, :pub_name))
  end
  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    # not able to access current user, so giving demo values to mandatory fields
    if @publisher.save!
      redirect_to publisher_setup_index_path
    else
      render 'new'
    end
  end
  private 

  def publisher_params
    params.require(:publisher).permit(:pub_code, :pub_name, :pub_status, :end_user_lang, :manager_lang, :publisher_contact_attributes =>[:contact_first_name, :contact_last_name, :contact_email])
  end
end
