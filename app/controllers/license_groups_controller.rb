class LicenseGroupsController < ApplicationController
 before_action :authenticate_user!

 def create
 	@license_group = LicenseGroup.new(license_group_params)
 	 @license_group.created_by = current_user.email
    respond_to do |format|
      if @license_group.save!
        add_license_group_id_to_license
        format.html {render "new" }
        format.js   { }
      else
        render 'new'
      end
    end
 end
 def add_license_group_id_to_license
    ids = params[:license_group][:role_ids].first
    ids = ids.split(',').map(&:squish)
    ids.each do |id|
      # for each Content ID
     license = License.find_by_license_id(id)
     license.license_group_id = @license_group.id
     license.save!
    end
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