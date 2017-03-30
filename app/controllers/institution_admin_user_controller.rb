class InstitutionAdminUserController < ApplicationController
  before_filter :set_system_generated_username

  def index
  end

  def search_op
    @res = InstitutionAdminUserAcc.filter(params.slice(:status,:role, :first_name))
    render 'result', locals: { :res => @res }
  end

  def show
  end

  def new
    @inst_admin_user = InstitutionAdminUserAcc.new
  end

  def create
    byebug
    @inst_admin_user = InstitutionAdminUserAcc.new(insti_admin_user_params)
    @user = params[:institution_admin_user_acc][:user_name]
    @rol = params[:institution_admin_user_acc][:role]
    if @rol == "Institution Administrator"
     @inst_admin_user.user_name = "SA_#{@user}"
    else
      @inst_admin_user.user_name = "PA#{@pcount}"
      @inst_admin_user.primary_count = "#{@pcount}"
    end
    if @inst_admin_user.save!
      redirect_to retailers_path
    else
      render 'new'
    end
  end
  
  def set_system_generated_username
    @pcount = "#{InstitutionAdminUserAcc.where.not(:primary_count => nil).last.primary_count + 1}" 
  end

  private

  def insti_admin_user_params
    params.require(:institution_admin_user_acc).permit(:role,  :publisher, 
      :institution_name,  :user_name,  :status,  :first_name,
      :last_name,  :email,  :phone,  :position,  :fax,  :password,  
      :confirm_password, :comments)    
  end
end

