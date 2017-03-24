class CampaignsController < ApplicationController
  def search
  end

  def create
    @campaign = Campaign.create!(campaign_params)
    redirect_to campaigns_path
  end

  def new
    @campaign = Campaign.new
  end

  def index
  end
  def search
    
  end
  private 
  def campaign_params
    params.require(:campaign).permit(:publisher, :campaign_name)
  end
end
