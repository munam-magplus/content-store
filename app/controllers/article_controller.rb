class ArticleController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
    @article.build_article_info
  end

  def index
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      redirect_to article_new_path
    else
      render 'new_article'
    end
  end

  def search
    #Call filter method to get search results
    @article = Article.filter(params.slice(:publisher, :title, :code, :doi, :volume, :issue, :article, :author_first_name, :author_last_name))
  end

  def article_params
    params.require(:article).permit(:publisher, :doi, :content_code, :journal_title, :article_type, :issue_type, 
        :volume_number, :volume_title, :issue_number, :issue_supplement, :issue_number_begin, :issue_number_end, :access_level, 
        :article_language, :external_drm, :article_sequence_number, :publisher_date, :issue_cover_date, :stock_number, :abstract, 
        :article_info_attributes => [:id, :contributor_info_role, :contributor_info_name, :contributor_info_description, 
        :content_format_format, :content_format_doi, :base_online_access_country, :base_online_access_currency, 
        :base_online_access_price, :base_download_price_country, :base_download_price_currency, :base_download_price_price]) 
  end
end
