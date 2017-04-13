class PrinthouseSetupController < ApplicationController
      before_action :authenticate_user!

  def index
  end

  def show
  end

  def search
  end

  def new
    @printhouse = Printhouse.new
  end

  def create
    @printhouse = Printhouse.new(printhouse_params)
    # not able to access current user, so giving demo values to mandatory fields
    @printhouse.CREATED_BY = "current_user_name"
    @printhouse.LASTUPDATED_BY = "current_user_name"
    #@publisher.build_publisher_contact
    if @printhouse.save!
      redirect_to printhouse_setup_index_path
    else
      render 'new'
    end
  end

  private 

  def printhouse_params
    params.require(:printhouse).permit(:PUB_PUBLISHER_ID, :PRI_PRINTHOUSE_CODE, 
    	:PRI_PRINTHOUSE_NAME,:PRI_RANK,:PRI_VAT_REGISTRATION_NUMBER,
    	:PRI_CONTACT_FIRST_NAME,:PRI_CONTACT_LAST_NAME ,:PRI_CONTACT_PHONE,
    	:PRI_CONTACT_EMAIL,:PRI_CONTACT_ADDRESS_LINE1,:PRI_CONTACT_ADDRESS_LINE2,
    	:PRI_CITY,:PRI_STATE,:PRI_POSTAL_CODE,:COI_COUNTRY_ID, 
    	:printhouse_type_attributes =>[:CDP_PUB_SHIPPING_TYPE_ID], 
    	:printhouse_country_attributes =>[:COI_COUNTRY_ID])
  end
end
