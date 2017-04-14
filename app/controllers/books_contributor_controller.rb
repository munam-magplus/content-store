class BooksContributorController < ApplicationController
  def new
    @book_contributor = BooksContributor.new
  end

  def create
    @book_contributor = BooksContributor.new(contributor_params)
    if @book_contributor.save!
      redirect_to books_content_pricing_new_path
    else
      render 'new'
    end
  end

  private
  def contributor_params
    params.require(:books_contributor).permit(:role, :name, :description, :doi, :dod, :professional_position, 
    :professional_affiliation, :website, :website_description)
  end
end
