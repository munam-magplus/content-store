class InstitutionAccountController < ApplicationController  
  def index
    # we render result page only when we find publisher in params.
    if params[:publisher].present?
      # we perform search operation by slicing the params.
      @res = InstitutionAccount.filter(params.slice(:publisher,:institution_id, :status))
      # this is the params of the checkbox that is present in the form.
      @chec = params[:ip_address]
      # we render the result page that have the search result.
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
    @institution.build_institution_acc_billing_address
  end

  def create
    byebug
    @institution = InstitutionAccount.new(institution_params)
    #this is added inorder to build institution_acc_billing_address
    #we use this syntax because the association between institution account
    # and institution_acc_billing_address is has_one
    # @institution.build_institution_acc_billing_address
    # byebug

    if @institution.save!
      redirect_to institution_account_index_path
    else
      render 'new'
    end

  end
 

  private

  def institution_params
    # byebug
    params.require(:institution_account).permit(:publisher,:institution_id, 
        :libary_name,:institution_name,:status,:display_name, 
        { institution_acc_billing_address_attributes: [
        :first_name, :last_name, :phone, :email, :address, 
        :address_line2,:address_line3, :city, :state, 
        :postal_code, :comments, :institution_account_id]} ) 
  end
end
