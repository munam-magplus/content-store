class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
    @article.build_article_information
  end

  def index
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      redirect_to new_article_path
    else
      render 'new_article'
    end
  end

  def search
    #Call filter method to get search results
    @article = Article.filter(params.slice(:publisher, :title, :code, :doi, :volume, :issue, :article, :author_first_name, :author_last_name))
  end

  def article_params
    params.require(:article).permit(:publisher_id, :date_of_issue, :content_code, :journal_title, :article_type, :issue_type, 
        :volume_number, :volume_title, :issue_number, :issue_supplement, :issue_number_begin, :issue_number_end, :access_level, 
        :article_language, :external_drm, :article_sequence_number, :publisher_date, :issue_cover_date, :stock_number, :abstract, 
        :article_information_attributes => [:id, :contributor_information_role, :contributor_information_name, :contributor_information_description, 
        :content_format_type, :content_format_date_of_issue, :base_online_access_country, :base_online_access_currency, 
        :base_online_access_price, :base_download_price_country, :base_download_price_currency, :base_download_price_price]) 
  end
end
