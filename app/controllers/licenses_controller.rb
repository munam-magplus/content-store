class LicensesController < ApplicationController
    before_action :authenticate_user!

  def create
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
end