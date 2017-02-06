class BooksController < ApplicationController
  def create
  	@book = BookContent.new
  end

  def search
  end
end

