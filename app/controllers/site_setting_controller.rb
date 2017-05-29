class SiteSettingController < ApplicationController
  def new
    @books_details = BooksPrimaryContentInformation.find_by_id(params[:format])
  end

  def create
  end

  def index
  end

  def search
    #Call filter method to get search results
    @books_search = BooksPrimaryContentInformation.filter(params.slice(:publisher_id, :book_title))
  end

  def delete
  end
end
