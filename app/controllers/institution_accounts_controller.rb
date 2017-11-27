class InstitutionAccountsController < ApplicationController  
  include InstitutionAccountHelper
  before_action :authenticate_user!

  def index
  end

  def add_subscription_tag
    SubscriptionInstitute.create!(subscription_id: params[:subscription_id], institution_account_id: params[:institute_account_id])
    flash[:notice] = 'Subscription are sucessfully created for innstitution!'
    redirect_to institution_accounts_path
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
    @institution = InstitutionAccount.new()
    #this is added inorder to build institution_acc_billing_address
    #we use this syntax because the association between institution account
    # and institution_acc_billing_address is has_one
    @institution.build_institution_account_billing_address
    @institution.ip_addresses.build
  end

  def create
    @institution = InstitutionAccount.create(institution_params)
    if @institution.save!
      ip_save_for_institute
      redirect_to institution_accounts_path
    else
      render 'new'
    end
  end

  def add_subscription
    @institute_account = InstitutionAccount.find_by_id(params[:id]) 
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
      :postal_code, :country_code, :comments, :institution_account_id],
      ips_attributes: [:low_ip, :high_ip],
      users_attributes: [:email, :password])
  end

    def ip_save_for_institute
      ip_store = params["institution_account"]["ip_addresses_attributes"]["0"]
      institution_id = @institution.id
      lw_ip = ip_store["low_ip"]
      hg_ip = ip_store["high_ip"]
      IpAddress.create!(low_ip: lw_ip, high_ip: hg_ip, institution_account_id: institution_id) 
    end
end





 


