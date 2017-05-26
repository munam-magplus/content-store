class SiteSettingController < ApplicationController
  def new
  end

  def create
  end

  def index
    #Call filter method to get search results
    @books_search = BooksPrimaryContentInformation.filter(params.slice(:publisher_id))
  end

  def delete
  end
end
