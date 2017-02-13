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
    @publisher.publisher_contact = PublisherContact.new
  end

  def create
    current_user = User.active.find(session[:user_id]) unless session[:user_id].nil?
    @publisher = Publisher.new(publisher_params)
    #@publisher.build_publisher_contact
    if @publisher.save!
      redirect_to publishers_path
    else
      render 'new'
    end
  end
  private 

  def publisher_params
    params.require(:publisher).permit(:PUB_CODE, :PUB_NAME, :PUB_STATUS,:PUB_END_USR_LANGUAGE, :PUB_ADMIN_TOOL_LANGUAGE_ID, :CREATED_BY,:LASTUPDATED_BY, :publisher_contact_attributes =>[:PUC_CONTACT_FNAME, :PUC_CONTACT_LNAME, :PUC_CONTACT_EMAIL, :PUC_CONTACT_TYPE])
  end
end
