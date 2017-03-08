class LicenseGroupsController < ApplicationController
  
  def create
  end

  def new
  end

  def index
  end

  def search
  	#call filter method to get search results
    @license_group = LicenseGroup.filter(params.slice(:PUB_PUBLISHER_ID, :LIG_GROUP_CODE, :LIG_LIC_GROUP_NAME, :CREATED_BY,  :LIG_FOR_SALE))
  end
end
