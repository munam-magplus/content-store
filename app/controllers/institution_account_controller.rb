class InstitutionAccountController < ApplicationController  
    before_action :authenticate_user!

  def index
  end
  
  def search_op
    # we perform search operation by slicing the params.
    @insti_acc = InstitutionAccount.filter(params.slice(:publisher_id, 
            :status, :libary_name, :institution_name))
    byebug
    # this is the params of the checkbox that is present in the form.
    @chec = params[:ip_address]
    # we render the result page that have the search result.
    render 'result', locals: { :insti_acc => @insti_acc, :chec => @chec} 
  end

  def result
  end

  def inst_admin_result
   @ins = InstitutionAccount.find_by_id(params[:format]).institution_name
   @ins_admin = InstitutionAdminUserAcc.where(:institution_name => @ins)
   byebug
  end 

  def new
    @publishers = Publisher.all
    @institution = InstitutionAccount.new
    #this is added inorder to build institution_acc_billing_address
    #we use this syntax because the association between institution account
    # and institution_acc_billing_address is has_one
    @institution.build_institution_acc_billing_address
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
  end

  def update
    
  end

  private

  def institution_params
    params.require(:institution_account).permit(:publisher_id,:institution_id, 
        :libary_name,:institution_name,:status,:display_name, 
        institution_acc_billing_address_attributes: [ :id,
        :first_name, :last_name, :phone, :email, :address, 
        :address_line2,:address_line3, :city, :state, 
        :postal_code,:country, :comments, :institution_account_id]) 
  end
end