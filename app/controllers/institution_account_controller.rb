class InstitutionAccountController < ApplicationController  
  def index
    byebug
    if params[:publisher].present?
      @res = InstitutionAccount.filter(params.slice(:publisher,:institution_id))
      @chec = params[:ip_address]
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
    byebug
    @institution = InstitutionAccount.new
  end

  def create
    byebug
    @institution = InstitutionAccount.new(institution_params)
    #this is added inorder to build institution_acc_billing_address
    #we use this syntax because the association is has_one
     @institution.build_institution_acc_billing_address

    if @institution.save!
      redirect_to institution_account_index_path
    else
      render 'new'
    end

  end
 

  private

  def institution_params
    byebug
    params.require(:institution_account).permit(:publisher,:institution_id, 
        :libary_name,:institution_name,:status,:display_name, 
        :institution_acc_billing_address_attributes =>[
        :id, :first_name, :last_name, :phone, :email, :address, 
        :address_line2,:address_line3, :city, :state, 
        :postal_code, :comments]) 
  end
end
