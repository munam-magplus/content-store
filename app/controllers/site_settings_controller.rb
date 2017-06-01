class SiteSettingsController < ApplicationController
    before_action :authenticate_user!

  def new
    @books_details = BooksPrimaryContentInformation.find_by_id(params[:format])
  end

  def create
  end

  def index
  end

  def search
    publisher = params[:publisher_id]
    @books_search = BooksPrimaryContentInformation.where(publisher_id: publisher)
  end

  def delete
  end
end
