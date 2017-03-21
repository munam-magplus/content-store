class InstitutionAccountController < ApplicationController
  def index
    @pub = Publisher.all
    @res =  InstitutionAccount.where(["pub = ? and inst_name = ?", params[:pub], params[:inst_name]]).all
    @chec = params[:ip_address]
    @country = params[:country]
    if @res.present?
      render 'result', locals: { :res => @res, :chec => @chec , :country => @country}
    else
      render 'index'
    end  
  end
  
  def result
  end

  def not_found
  end

  def new
    @institution = InstitutionAccount.new
  end

  def create
    @institution = InstitutionAccount.create(institution_params)
    @institution.build_institution_acc_billing_address

    if @institution.save!
      redirect_to institution_account_index_path
    else
      render 'new'
    end
  end
 

  private

  def institution_params
    params.require(:institution_account).permit(:pub,:inst_ID, 
        :Lib_name,:inst_name,:status,:display_name, :institution_acc_billing_address_attributes => [
        :first_name,:last_name,:phone,:email,:address,:add_line2,
        :add_line3,:city,:state,:postal_code,:country,:comments]) 
  end
end
