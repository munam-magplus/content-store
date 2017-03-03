class SiteSettings::SiteSettingController < ApplicationController
  
  def index
  	@pub = Publisher.all
  	@res = PublisherStaticData.where(:PUB_PUBLISHER_ID => params[:PUB_PUBLISHER_ID]).all
  		byebug
  	if @res.present?
  		  	@pubname = Publisher.where(:PUB_PUBLISHER_ID => @res.last.PUB_PUBLISHER_ID).first

  		render 'operation', :locals => { :res => @res, :pubname => @pubname }
  	else
  		render 'index'
  	end
  end

  def operation
  	byebug
  end
end
