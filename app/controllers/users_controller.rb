class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /cdp_users
  # GET /cdp_users.json
  def index
    @users = User.all
  end

  # GET /cdp_users/1
  # GET /cdp_users/1.json
  def show
  end

  # GET /cdp_users/new
  def new
    @user = User.new
  end

  # GET /cdp_users/1/edit
  def edit
  end

  # POST /cdp_users
  # POST /cdp_users.json
  def create
    @user = User.new(user_params)

    # respond_to do |format|
      if @user.save
        sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_url
    else
      render 'new'
      #   format.html { redirect_to @cdp_user, notice: 'Cdp user was successfully created.' }
      #   format.json { render :show, status: :created, location: @cdp_user }
      # else
      #   format.html { render :new }
      #   format.json { render json: @cdp_user.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /cdp_users/1
  # PATCH/PUT /cdp_users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cdp_users/1
  # DELETE /cdp_users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def forgot_password
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :encrypted_password)
    end
end
