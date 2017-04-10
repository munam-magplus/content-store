class AdminUserController < ApplicationController
  def search
    #Call filter method to get search results
    @admin_user = AdminUser.filter(params.slice(:publisher, :email, :first_name, :country, :user_type))
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save!
      # If successfully stored then redirect to  setup path 
      redirect_to admin_user_new_path
    else
      # If not save in that case render new
      render 'new'
    end
  end

  def search_result
    @admin_user = AdminUser.search(params[:pub_id], params[:name], params[:code], params[:lang_id])
    render :partial => 'search_result'
  end
  
  private 
  def admin_user_params
    params.require(:admin_user).permit(:publisher, :email, 
    :confirm_email, :password, :confirm_password, :first_name, :last_name, :country,
    :language, :user_type, :role, :publishers)
  end
end
