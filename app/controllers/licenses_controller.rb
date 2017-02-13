class LicensesController < ApplicationController
  def search
  end

  def create
  end

  def new
  end
  def search
    @license = License.filter(params.slice(:PUB_PUBLISHER_ID, :LIC_LICENSE_CODE,:LIC_LICENSE_NAME, :lic_type,  :LIC_FOR_SALE))
    render :partial => 'search_result', locals:{:lic => @license}
  end

  def index
    @publishers= Publisher.pluck(:PUB_NAME)
  end
end
