class LicensesController < ApplicationController
  
  def create
  end

  def new
  end
  
  def search
    search_to_apply_discount = params[:apply_discount].to_i # to differentiate license search and license search to apply discount
    @license = License.filter(params.slice(:PUB_PUBLISHER_ID, :LIC_LICENSE_CODE,:LIC_LICENSE_NAME, :LIC_ISBN_IDENTIFIER, :CREATED_BY, :LIC_FOR_SALE)) # call to search module method
  end

  def index
  end
end
