class CampaignsController < ApplicationController
    before_action :authenticate_user!

  def search
  end

  def create
    @campaign = Campaign.create!(campaign_params)
    # redirect_to search path after create
    redirect_to campaigns_path
  end

  def new
    @campaign = Campaign.new
  end

  def index
  end
  def search
    #call filter method to get search reults.
   @campaigns = Campaign.filter(params.slice(:publisher_id, :campaign_name,:created_by,:from, :to))
  end

  private 
  def campaign_params
    params.require(:campaign).permit(:publisher_id, :campaign_name)
  end
end