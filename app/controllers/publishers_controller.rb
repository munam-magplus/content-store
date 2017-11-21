class PublishersController < ApplicationController
      before_action :authenticate_user!

  def index
    @publisher = Publisher.all
  end

  def search
    #call filter method to get search results
    @publisher = Publisher.filter(params.slice(:publisher_code, :publisher_name))
     respond_to do |format|
      format.js 
      format.html
      format.xlsx  
    end
  end

  def edit 
    @publisher = Publisher.find(params[:id])
    render 'new'
  end
  
  def new
    @publisher = Publisher.new
    @publisher.users.build
  end

  def save  
    if params[:publisher][:id] != ""
      @publisher = Publisher.find(params[:publisher][:id])
      if @publisher.update_attributes!(publisher_params)
        user_edit_for_publisher
      # Handle a successful update.
        flash[:notice] = 'Publisher was successfully updated.'
        redirect_to publishers_path
      else
        render 'edit'
      end
    else
      @publisher = Publisher.new(publisher_params)  
      if @publisher.save!
        user_save_for_publisher
        flash[:success] = "Publisher Created!"
        # if successfully stored then redirect to publisher's setup path 
        redirect_to publishers_path
      else
        # if not save in that case render new
        render 'new'
      end
    end
  end

  def destroy
    @publisher = Publisher.find( params[:id])
    @publisher.destroy
    redirect_to :back
  end
  
  private 
  def publisher_params
    params.require(:publisher).permit(:publisher_code, :publisher_name, 
    :publisher_status, :publisher_type, :end_user_language, :manager_language,
    :contact_first_name, :contact_last_name, :contact_email, :publisher_logo, 
    :country_code,:domain_name, :about, :policy, :terms_and_conditions, :publisher_address,
    users_attributes: [:email, :password, :role_id])
  end

  def user_edit_for_publisher
    publish_id = @publisher.id
    user_store = params["publisher"]["users"]
    user_email = user_store["email"]
    user_password = user_store["password"]
    user_role_id = user_store["role_id"]
    @publisher.users.last.update_attributes(password: user_password)
  end

  def user_save_for_publisher 
    publish_id = @publisher.id
    user_store = params["publisher"]["users"]
    user_email = user_store["email"]
    user_password = user_store["password"]
    user_role_id = user_store["role_id"]
    User.create!(email: user_email, password: user_password, role_id: user_role_id, publisher_id: publish_id) 
  end
end