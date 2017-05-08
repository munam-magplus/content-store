class JournalsController < ApplicationController
   before_action :authenticate_user!

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save!
      redirect_to new_journal_path
    else
      render 'new'
    end
  end

  def show
  end

  def search
    @journal = Journal.filter(params.slice(:publisher, :journal_code, :journal_title, :journal_primary_issn, :journal_electronic_issn))
  end

  private
  def journal_params
    params.require(:journal).permit(:journal_code, :publisher, 
    :journal_title, :journal_subtitle, :journal_primary_issn, :journal_electronic_issn,
    :language, :journal_content_classification, :journal_distribution, :price_in, :journal_publisher_date, 
    :stock_number, :cover_image, :journal_categories, :journal_description, :editorial, :instructions_for_authors)
  end
end