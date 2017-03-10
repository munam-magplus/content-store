class JournalsController < ApplicationController
 
  def new
    @journal = Journal.new
    byebug
  end

  def create
    byebug
  @journal = Journal.new(journal_params)
    if @journal.save!
      redirect_to books_create_path
    else
      render 'new'
    end
  end

  def search
  end

  def search_result
    @journal = Journal.search(params[:pub_id], params[:name], params[:code], params[:lang_id])
    render :partial => 'search_result'
  end

  def upload_article_metadata
  end

  def search_article
  end

  def new_article
  end
  
  private
  def journal_params
    params.require(:journal).permit(:journal_code, :publisher, 
    :journal_title, :journal_subtitle, :journal_primary_issn, :journal_electronic_issn,
    :language, :journal_content_classification, :journal_distribution, :price_in, :journal_publisher_date, 
    :stock_number, :cover_image, :journal_categories, :journal_description, :editorial, :instructions_for_authors)
  end
end
