class InstitutionController < ApplicationController
  def index
    byebug
    @pub = Publisher.all
    @country = Countryname.all
    @res = Institution.where(:INS_INSTITUTION_ID => params[:INS_INSTITUTION_ID]).all
    if @res.present?
      render 'result', locals: { :res => @res }
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
