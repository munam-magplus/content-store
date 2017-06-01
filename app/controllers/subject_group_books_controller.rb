class SubjectGroupBooksController < ApplicationController
  def new
  	@associate_books = SubjectGroupBook.new
  end

  def index
  end

  def create
    if params[:book_id].any?
      book_ids = params[:book_id]
      book_ids.each do |book|
        @associate_books = SubjectGroupBook.new
        @associate_books.subject_group_id = params[:subject_group_id]
        @associate_books.books_primary_content_information_id = book
        @associate_books.save!
      end
      redirect_to new_subject_group_path
    end
  end  
end
