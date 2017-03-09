class LicensesController < ApplicationController
  
  def create
  end

  def new
  end
  
  def search
    search_to_apply_discount = params[:apply_discount].to_i # to differentiate license search and license search to apply discount
    @license = License.filter(params.slice(:id, :lic_id, :lic_name, :lic_type, :ISBN)) # call to search module method
  end

  def index
  end
end
