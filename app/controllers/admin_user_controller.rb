class AdminUserController < ApplicationController
  def search
    #Call filter method to get search results
    @admin_user = AdminUser.filter(params.slice(:publisher, :email, :first_name, :country, :user_type))
  end

  def new
    byebug
    @admin_user = AdminUser.new
  end

  def create
    byebug
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save!
      # If successfully stored then redirect to  setup path 
      redirect_to admin_user_index_path
    else
      # If not save in that case render new
      render 'new'
    end
  end

  private 
  def admin_user_params
    params.require(:admin_user).permit(:publisher, :email, 
    :confirm_email, :first_name, :last_name, :country,
    :language, :user_type, :role, :publishers)
  end
end
