class InstitutionAccountsController < ApplicationController  
  include InstitutionAccountHelper
  before_action :authenticate_user!

  def index
  end

  def search 
     @institution_account = InstitutionAccount.filter(params.slice(:publisher_id, 
            :status, :library_name, :institution_name, :id))

    @id = @institution_account.ids

    @institution_billing = InstitutionAccountBillingAddress.filter(params.slice(:first_name, :last_name,
                  :phone, :email,:address,:address_line2,:address_line3,:city,:state,
                  :postal_code,:country_code))

    @result = @institution_billing.where(institution_account_id: @id)
    
      # this is the params of the checkbox that is present in the form.
    @check = params[:ip_address]
    respond_to do |format|
      format.js 
      format.html
      format.xlsx
     end
  end

  def institution_admin_result
    @institution = InstitutionAccount.find_by_id(params[:id]).institution_name
    @institution_admin = InstitutionAdminUserAccount.where(:institution_name => @institution)
    respond_to do |format|
      format.html   
      format.xlsx { send_data @institution_admin }
    end
  end 

  def new
    @publishers = Publisher.all
    @institution = InstitutionAccount.new
    #this is added inorder to build institution_acc_billing_address
    #we use this syntax because the association between institution account
    # and institution_acc_billing_address is has_one
    @institution.build_institution_account_billing_address
  end

  def create
    @institution = InstitutionAccount.new(institution_params)
  
    if @institution.save!
      redirect_to institution_accounts_path
    else
      render 'new'
    end
    
  end
 
  def edit
    @institution = InstitutionAccount.find_by_id(params[:id]) 
  end

  def update
    @institution = InstitutionAccount.find_by(params[:id])
    if @institution.update(institution_params)  
      redirect_to institution_accounts_path
    else
      render 'index'
    end
  end

  private

  def institution_params
    params.require(:institution_account).permit(:publisher_id,:institution_id, 
        :library_name,:institution_name,:status,:display_name, :logo, 
        institution_account_billing_address_attributes: [ :id,
        :first_name, :last_name, :phone, :email, :address, 
        :address_line2,:address_line3, :city, :state, 
        :postal_code, :country_code, :comments, :institution_account_id]) 
  end
end