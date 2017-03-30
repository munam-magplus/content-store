class LicensesController < ApplicationController
  
  def create
  end

  def new
  end
  
  def search
    search_to_apply_discount = params[:apply_discount].to_i # to differentiate license search and license search to apply discount
   @license = License.filter(params.slice(:publisher_id, :license_id, :license_name, :license_type, :isbn , :created_by, :license_for_sale)) # call to search module method
  end

  def index
  end
end