class InstitutionController < ApplicationController
  def index
    @pub = Publisher.all
    @country = Countryname.all
    @res = Institution.where(:INS_INSTITUTION_ID => params[:INS_INSTITUTION_ID]).all
    @chec = params[:ip_address]
    if @res.present?
      render 'result', locals: { :res => @res, :chec => @chec }
    else
      render 'index'
    end  
  end
  def result
  end

  def new
    @institution = Institution.new
  end

  def create
  end

end
