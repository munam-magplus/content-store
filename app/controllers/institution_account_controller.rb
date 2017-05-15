class InstitutionAccountController < ApplicationController  
  include InstitutionAccountHelper
  before_action :authenticate_user!

  def index
  end
  # (params[:institution_name].present?)||(params[:publisher_id].present?)||(params[:status].present?)||(params[:libary_name].present?)
  def search_op
    # @insti_acc1 = InstitutionAccount.paginate(:page => params[:page], :per_page => 2)
    # we perform search operation by slicing the params.
     # if ((params[:institution_name].present?)||(params[:publisher_id].present?)||(params[:status].present?)||(params[:libary_name].present?)) 
    # @id = InstitutionAccount.find_by_id(params[:institution_id])
     @insti_acc = InstitutionAccount.filter(params.slice(:publisher_id, 
            :status, :libary_name, :institution_name, :id))
    # else
    # @insti_bill = InstitutionAccountBillingAddress.filter(params.slice(:first_name, :last_name,
    #               :phone, :email,:address,:address_line2,:address_line3,:city,:state,
    #               :postal_code,:country_code))
    # end
     # this is the params of the checkbox that is present in the form.
    @chec = params[:ip_address]
    # byebug
    respond_to do |format|
     format.js 
     format.html
     format.xlsx 
    end
  end

  def inst_admin_result
    @ins = InstitutionAccount.find_by_id(params[:id]).institution_name
    @ins_admin = InstitutionAdminUserAccount.where(:institution_name => @ins)
    respond_to do |format|
       format.html   
       format.xlsx { send_data @ins_admin }
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
      redirect_to institution_account_index_path
    else
      render 'new'
    end
    
  end
 
  def edit
    @institution = InstitutionAccount.find_by(params[:id]) 
  end

  def update
    @institution = InstitutionAccount.find_by(params[:id])
    if @institution.update(institution_params)  
      redirect_to institution_account_index_path
    else
      render 'index'
    end
  end

  private

  def institution_params
    params.require(:institution_account).permit(:publisher_id,:institution_id, 
        :libary_name,:institution_name,:status,:display_name, :logo, 
        institution_account_billing_address_attributes: [ :id,
        :first_name, :last_name, :phone, :email, :address, 
        :address_line2,:address_line3, :city, :state, 
        :postal_code, :country_code, :comments, :institution_account_id]) 
  end
end