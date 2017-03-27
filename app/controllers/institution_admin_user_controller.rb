class InstitutionAdminUserController < ApplicationController
  def index
  end

  def search_op
    byebug
    @res = InstitutionAdminUserAcc.filter(params.slice(:status,:role, :first_name))
    render 'result', locals: { :res => @res }
  end

  def show
  end

  def new
    @inst_admin_user = InstitutionAdminUserAcc.new
  end

  def create
    @inst_admin_user = InstitutionAdminUserAcc.new(insti_admin_user_params)
    if @inst_admin_user.save!
      redirect_to institution_admin_user_index_path
    else
      render 'new'
    end
  end
  

  private

  def insti_admin_user_params
    params.require(:inst_admin_user).permit(:role,  :publisher, 
      :institution_name,  :user_name,  :status,  :first_name,
      :last_name,  :email,  :phone,  :position,  :fax,  :password,  
      :confirm_password, :comments)    
  end
end
