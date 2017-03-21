class CampaignsController < ApplicationController
  def search
  end

  def create
     @campaign = Campaign.create!(campaign_params)
     if @campaign.save!
      # if successfully stored then redirect 
      redirect_to campaigns
    else
      # if not save then render same page
      render 'new'
    end
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
    params.require(:campaign).permit(:pub, :campaign_name)
  end
end
