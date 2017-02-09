class JournalsController < ApplicationController
  def new
    @pub = Publisher.pluck(:PUB_NAME)
    @journal = Journal.new
  end

  def search
  end

  def upload_article_metadata
  end

  def search_article
  end

  def new_article
    @pub = Publisher.pluck(:PUB_NAME)
  end
end
