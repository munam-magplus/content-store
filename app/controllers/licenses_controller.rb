class LicensesController < ApplicationController
    before_action :authenticate_user!

 def create
  @license = License.new(license_params)
   @license.created_by = current_user.email
  if @license.save!
   flash[:success] = "License Created!"
   # if successfully stored then redirect to license group's setup path 
   redirect_to licenses_path
  else
   # if not save in that case render new
   render 'new'
  end
 end

  def new
    @license = License.new
  end
  def content_search
    # search for the Content at the time of License creation
    @content_for_license = BooksPrimaryContentInfo.filter(params.slice(:title, :isbn))
  end
  
  def search
    search_to_apply_discount = params[:apply_discount] # to differentiate license search and license search to apply discount
    @license = License.filter(params.slice(:publisher_id, :license_id, :license_name, :license_type, :isbn , :created_by, :license_for_sale)) # call to search module method
    if !search_to_apply_discount.nil?
      render 'search_to_apply_discount'
    end
  end
  def apply_discount
    render 'search_to_apply_discount'
  end

  def index
  end
  private 

  def license_params
   params.require(:license).permit(:license_name, :from, 
   :to, :license_for_sale, :license_is_linkable, :license_link_from_date, :license_link_to_date,:license_shipping_is_free,:license_discount_percentage)
  end
end