class LicenseGroupsController < ApplicationController
    before_action :authenticate_user!

  def create
  end

  def new
     @license_group = LicenseGroup.new
  end

  def index
  end

  def search
    #call filter method to get search results
    @license_group = LicenseGroup.filter(params.slice(:publisher_id, :license_group_id, :license_group_name, :license_name, :created_by, :license_for_sale))
  end
end
