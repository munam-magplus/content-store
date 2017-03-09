class LicenseGroupsController < ApplicationController
  
  def create
  end

  def new
  end

  def index
  end

  def search
  	#call filter method to get search results
    @license_group = LicenseGroup.filter(params.slice(:id, :lic_group_ID, :lic_group_name, :lic_name))
  end
end
