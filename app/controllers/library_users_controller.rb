class LibraryUsersController < ApplicationController
  def index
    @library_users = LibraryUser.all
  end

  def new
    @library_user = LibraryUser.new
    @@institution_id = params[:format]
   end

  def create
      @library_user = LibraryUser.new(library_user_params)
    if @@institution_id.present?
       @library_user.institution_account_id = @@institution_id
    end
    if @library_user.save!
      redirect_to institution_accounts_path
    else
      render 'new'
    end
  end

  def result
    @institution_id = params[:id]
    @library_users = LibraryUser.where(institution_account_id: @institution_id)
  end

  def edit
     @library_user = LibraryUser.find_by_id(params[:id])
  end

  def update
    @library_user = LibraryUser.find_by_id(params[:id])
    if @library_user.update(library_user_params)
      redirect_to :back #to render to previous page
    else
      render 'new'
    end
  end

  def delete
    @library_user = LibraryUser.find_by_id(params[:id])
    if @library_user.destroy(library_user_params)
      redirect_to institution_accounts_path
    else
      render 'new'
    end
  end

  private

  def library_user_params
    params.require(:library_user).permit(:first_name, :last_name,:email,
                   :user_name, :password, :password_confirmation, 
                   :country, :status, :password_digest, :institution_account_id )
  end
end