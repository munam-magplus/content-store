class JournalsController < ApplicationController
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
    @article = Article.new
  end

  def create_article
    @article = Article.create(article_params)
    @article.article_infos.build
    if @article.save!
      redirect_to new_article_journals_path
    else
      render 'new'
    end
  end

  private
  def journal_params
    params.require(:journal).permit(:journal_code, :publisher, 
    :journal_title, :journal_subtitle, :journal_primary_issn, :journal_electronic_issn,
    :language, :journal_content_classification, :journal_distribution, :price_in, :journal_publisher_date, 
    :stock_number, :cover_image, :journal_categories, :journal_description, :editorial, :instructions_for_authors)
  end

  def article_params
    params.require(:article).permit(:publisher, :doi, 
        :content_code, :journal_title, :article_type, :issue_type, 
        :volume_number, :volume_title, :issue_number, :issue_supplement,
        :issue_number_begin, :issue_number_end, :access_level, 
        :article_language, :external_drm, :article_sequence_number, 
        :publisher_date, :issue_cover_date, :stock_number, :abstract, 
        :article_infos_attributes => [:contributor_info_role, 
        :contributor_info_name, :contributor_info_description, 
        :content_format_format, :content_format_doi, 
        :base_online_access_country, :base_online_access_currency, 
        :base_online_access_price, :base_download_price_country, 
        :base_download_price_currency, :base_download_price_price]) 
  end
end