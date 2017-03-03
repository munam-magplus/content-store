class CsretailersController < ApplicationController
  def index
    @retailers = Csretailer.all
    @retail = Csretailer.pluck(:PUB_PUBLISHER_ID)
    @publishers = Publisher.where(:PUB_PUBLISHER_ID => @retail).pluck(:PUB_NAME)
  end 
  
  def new
    @retailer = Csretailer.new
  end
  
  def create
    @retailer = Csretailer.new(retailer_params)
    if @retailer.save
      redirect_to csretailers_path
    else
      render 'new'
    end
  end
  
  def search
    @pub = params[:retailer_name]
    @re = Publisher.where(:PUB_NAME => @pub).first
    render :partial => 'new', locals: { :re => @re }
  end

  private 
 
  def retailer_params
    params.require(:csretailer).permit(:RETAILER_CODE, :REATILER_NAME, :PUB_PUBLISHER_ID,
                    :REFERRAL_URL, :RETAILER_IP_RANGE, :RETAILER_STATUS_CD, :RETAILER_CONFIG_PATH,
                    :RETAILER_SALES_LINK, cs_retailerip_attributes: [:CRI_IP_AUTH_ID, :CRI_LOW_IP, :CRI_HIGH_IP, :CRI_IP_LIST, :CRI_RETAILER_CODE])
  end
end 

