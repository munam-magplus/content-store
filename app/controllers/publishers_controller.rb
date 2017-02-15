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
    @publisher = Publisher.new(publisher_params)
    # not able to access current user, so giving demo values to mandatory fields
    @publisher.CREATED_BY = "current_user_name"
    @publisher.LASTUPDATED_BY = "current_user_name"
    @publisher.publisher_contact.PUC_CONTACT_TYPE = "demo"
    #@publisher.build_publisher_contact
    if @publisher.save!
      redirect_to publishers_path
    else
      render 'new'
    end
  end
  private 

  def publisher_params
    params.require(:publisher).permit(:PUB_CODE, :PUB_NAME, :PUB_STATUS,:PUB_END_USR_LANGUAGE, :PUB_ADMIN_TOOL_LANGUAGE_ID, :publisher_contact_attributes =>[:PUC_CONTACT_FNAME, :PUC_CONTACT_LNAME, :PUC_CONTACT_EMAIL])
  end
end
