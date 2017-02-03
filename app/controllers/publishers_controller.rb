class PublishersController < ApplicationController
  def index
  end

  def show
  end
  def search
  end
  def new
  	@publisher = Publisher.new
  end

  def create
  	byebug
  end 
end
