class LicensesController < ApplicationController
  
  def create
  end

  def new
    @license = License.new
  end
  def search_content
    
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