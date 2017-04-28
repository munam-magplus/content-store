class LicenseGroupsController < ApplicationController
 before_action :authenticate_user!

 def create
  byebug
 	@license_group = LicenseGroup.new(license_group_params)
 	 @license_group.created_by = current_user.email
    respond_to do |format|
      if @license_group.save!
        format.html {render "new" }
        format.js   { }
      else
        
      end
    end
 	# if @license_group.save!
  #     flash[:success] = "License Group Created!"
  #     # if successfully stored then redirect to license group's setup path 
  #     redirect_to license_group_path
  #   else
  #     # if not save in that case render new
  #     render 'new'
  #   end
 end

 def new
  @license_group = LicenseGroup.new
 end

 def content_search
  # search for the License at the time of License Group creation
  @license_content = License.filter(params.slice(:publisher_id, :license_id, :license_type, :license_name, :isbn))
 end
 
 def index
 end

  def new
    @license_group = LicenseGroup.new
  end

 def search
  #call filter method to get search results
  @license_group = LicenseGroup.filter(params.slice(:publisher_id, :license_group_id, :license_group_name, :license_name, :created_by, :license_for_sale))
 end

 private 

  def license_group_params
    params.require(:license_group).permit(:license_group_name, :from, 
    :to, :license_for_sale, :purchase_info_discount)
  end
end