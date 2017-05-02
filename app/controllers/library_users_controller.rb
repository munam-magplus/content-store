class LibraryUsersController < ApplicationController
  def index
    @library_user = LibraryUser.all
  end

  def new
    @library_user = LibraryUser.new
    @@insti_id = params[:format]
   end

  def create
      @library_user = LibraryUser.new(library_user_params)
    if @@insti_id.present?
       @library_user.institution_account_id = @@insti_id
    end
    if @library_user.save!
      redirect_to result_library_users_path 
    else
      render 'new'
    end
  end

  def result
    @ins_id = params[:id]
    @v = @ins_id
    @lib = LibraryUser.where(institution_account_id: @ins_id)
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
      redirect_to institution_account_index_path
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