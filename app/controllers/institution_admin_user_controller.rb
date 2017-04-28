class InstitutionAdminUserController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_system_generated_username

  def index  
  end

  def search_op
    # we search admin users by using status,role and first_name.
    # here, we filter the params and get status,role and first_name only.
    @res = InstitutionAdminUserAcc.filter(params.slice(:institution_name, 
                    :status,:role, :first_name, :user_name, :last_name, :email))
    render 'result', locals: { :res => @res, :ins => @ins }
  end

  def show
  end

  def new
     if params[:format].present?
     @inst = InstitutionAccount.find_by_institution_name(params[:format])
    end
    @inst_admin_user = InstitutionAdminUserAcc.new
  end

  def create
    # create new institution admin user
    @inst_admin_user = InstitutionAdminUserAcc.new(insti_admin_user_params)
    # get username and role of the admin user
    @user = params[:institution_admin_user_acc][:user_name]
    @rol = params[:institution_admin_user_acc][:role]
    @billing = params[:billing_contact]
    
    if params[:institution_admin_user_acc][:institution_name2].present?
    @inst_admin_user.publisher_id = params[:institution_admin_user_acc][:publisher_id2]
    @inst_admin_user.institution_name = params[:institution_admin_user_acc][:institution_name2]
    end
    
    # inserting user name with SA prefix only for Institution Administrator
    if @rol == "Institution Administrator"
     @inst_admin_user.user_name = "SA_#{@user}"
    else
      # inserting user name with PA as prefix and increment the pcount only when
      # the role is primary institution administrator.
      @inst_admin_user.user_name = "PA#{@pcount}"
      # store value in primary_count only when role is primary institution administrator.
      # otherwise primary_count's value is nil.
      @inst_admin_user.primary_count = "#{@pcount}"
    end
    #inorder to get institution_account_billing_addresses data
    if @billing == "1"
      if params[:institution_admin_user_acc][:institution_name2].present?
        @insti = InstitutionAccount.find_by(:institution_name => params[:institution_admin_user_acc][:institution_name2])  
      else
        @insti = InstitutionAccount.find_by(:institution_name => params[:institution_admin_user_acc][:institution_name])
      end
      @bill_add = @insti.institution_acc_billing_address
      @inst_admin_user.first_name = @bill_add.first_name
      @inst_admin_user.last_name = @bill_add.last_name
      @inst_admin_user.email = @bill_add.email
      @inst_admin_user.phone = @bill_add.phone
    end

    @password = params[:institution_admin_user_acc][:password]
    @confirm_password = params[:institution_admin_user_acc][:confirm_password]

    if @password == @confirm_password
      if @inst_admin_user.save!
        redirect_to manage_user_account_index_path
      else
        render 'new'
      end
    else
      render 'new'
    end
    if params[:mail] == "1"
      InstitutionAdminUserMailer.confirm_mail(@inst_admin_user, current_user).deliver
    end
  end

  def edit   
    @inst_admin_user = InstitutionAdminUserAcc.find_by_id(params[:id])
  end

  def update
    @inst_admin_user = InstitutionAdminUserAcc.find_by(params[:id])
   if @inst_admin_user.update(insti_admin_user_params)
    redirect_to search_op_institution_admin_user_index_path
    else 
      render 'index'
    end
  end

  def set_system_generated_username
    # the primary Institution Administrator's role is system generated.inorder to achieve 
    # this,we use primary_count.
    # if the role is Institution Administrator, the primary_count is nil and if the role 
    # is primary Institution Administrator,the primary_count value is incremented.
    @pcount = "#{InstitutionAdminUserAcc.where.not(:primary_count => nil).last.primary_count + 1}" 
  end

  private

  def insti_admin_user_params
    params.require(:institution_admin_user_acc).permit(:role,  :publisher_id, 
      :institution_name,  :user_name,  :status,  :first_name,
      :last_name,  :email,  :phone,  :position,  :fax,  :password,  
      :confirm_password, :comments)    
  end

end

