class JournalsController < ApplicationController
 
  def new
    @journal = Journal.new
  end

  def create
  @journal = Journal.new(journal_params)
    if @journal.save
      redirect_to new_journal_path
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
    params.require(:journal).permit(:JOC_JOUR_PISSN, :JOC_CODE, 
    :JOC_ABBREVIATION, :JOC_JOUR_EISSN, :JOC_OWNER, :JOC_DISTRIBUTORS,
    :JOC_ISSUE_FREQUENCY, :JOC_CURRENT_ISSUE_ID, :JOC_DESCRIPTION, :LASTUPDATED_BY, :LAN_LANGUAGE_ID, 
    :SHORT_DESC)
  end
end
