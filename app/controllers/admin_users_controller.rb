class AdminUsersController < ApplicationController
   before_action :authenticate_user!

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save!
      flash[:success] = "Admin User Created!"
      # If successfully stored then redirect to  setup path 
      redirect_to admin_users_path
    else
      # If not save in that case render new
      render 'new'
    end
    if params[:mail] == "1"
      AdminUserMailer.confirm_mail(@admin_user, current_user).deliver
    end
  end

  def index
  end

  def search
    #Call filter method to get search results
    @admin_user = AdminUser.filter(params.slice(:publisher_id, :email, :first_name, :country_code, :user_type))
  end
  
  private 
  def admin_user_params
    params.require(:admin_user).permit(:publisher_id, :email, 
    :password, :first_name, :last_name, :country_code, :language, 
    :user_type)
  end
end