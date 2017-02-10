class CdpUsersController < ApplicationController
  before_action :set_cdp_user, only: [:show, :edit, :update, :destroy]

  # GET /cdp_users
  # GET /cdp_users.json
  def index
    @cdp_users = CdpUser.all
  end

  # GET /cdp_users/1
  # GET /cdp_users/1.json
  def show
  end

  # GET /cdp_users/new
  def new
    @cdp_user = CdpUser.new
  end

  # GET /cdp_users/1/edit
  def edit
  end

  # POST /cdp_users
  # POST /cdp_users.json
  def create
    @cdp_user = CdpUser.new(cdp_user_params)

    # respond_to do |format|
      if @cdp_user.save
        sign_in @cdp_user
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
      if @cdp_user.update(cdp_user_params)
        format.html { redirect_to @cdp_user, notice: 'Cdp user was successfully updated.' }
        format.json { render :show, status: :ok, location: @cdp_user }
      else
        format.html { render :edit }
        format.json { render json: @cdp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cdp_users/1
  # DELETE /cdp_users/1.json
  def destroy
    @cdp_user.destroy
    respond_to do |format|
      format.html { redirect_to cdp_users_url, notice: 'Cdp user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cdp_user
      @cdp_user = CdpUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cdp_user_params
      params.require(:cdp_user).permit(:USE_USER_TYPE, :CREATED_BY, :LASTUPDATED_BY, :USE_USER_NAME, :USE_FIRST_NAME, :USE_LAST_NAME, :PUY_PUBLISHER_COUNTRY_ID, :USE_EMAIL, :USE_USER_PASS)
    end
end
