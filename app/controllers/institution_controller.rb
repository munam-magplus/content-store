class InstitutionController < ApplicationController
  def index
    @pub = Publisher.all
    @country = Countryname.all
    @res =  Institution.where(["PUB_PUBLISHER_ID = ? and INS_INSTITUTION_ID = ?", params[:PUB_PUBLISHER_ID], params[:INS_INSTITUTION_ID]]).all
    @chec = params[:ip_address]
    @count = params[:PUY_PUBLISHER_COUNTRY_ID]
    if @res.present?
      render 'result', locals: { :res => @res, :chec => @chec , :count => @count}
    else
      render 'index'
    end  
  end
  
  def result
  end

  def not_found
  end

  def new
    @institution = Institution.new
  end

  def create
    @institution = Institution.new(institution_params)
     if @institution.save!
      redirect_to institution_index_path
    else
      render 'new'
    end
  end

  private

  def institution_params
    params.require(:institution).permit(:PUB_PUBLISHER_ID,:INS_INSTITUTION_ID, 
        :INS_LIB_DEPT_NAME,:INS_INSTITUTION_NAME,:INS_INSTITUTION_STATUS,
        :INS_DISPLAY_NAME,:INS_FIRST_NAME,:INS_LAST_NAME,
        :INS_PHONE_NUMBER,:INS_EMAIL_ID,:INS_ADDRESS,:INS_ADDRESS_LINE2,
        :INS_ADDRESS_LINE3,:INS_CITY,:INS_STATE,:INS_POSTAL_CODE,
        :PUY_PUBLISHER_COUNTRY_ID,:INS_COMMENTS)  
  end
end
