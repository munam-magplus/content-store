class ContentConversationsController < ApplicationController
    before_action :authenticate_user!

    def download_books
	  send_file(
	    "#{Rails.root}/public/BooksMetadataTemplate.xls",
	    filename: "BooksMetadataTemplate.xls",
	    type: "application/xls"
	  )
	end

	 def download_article
	  send_file(
	    "#{Rails.root}/public/ArticleMetadataTemplate.xls",
	    filename: "ArticleMetadataTemplate.xls",
	    type: "application/xls"
	  )
	end

	def download_subject_group
	  send_file(
	    "#{Rails.root}/public/SubjectGroupTemplate.xls",
	    filename: "SubjectGroupTemplate.xls",
	    type: "application/xls"
	  )
	end

	 def download_update_status
	  send_file(
	    "#{Rails.root}/public/ArticleMetadataTemplate.xls",
	    filename: "ArticleMetadataTemplate.xls",
	    type: "application/xls"
	  )
	end

	 def download_index_content
	  send_file(
	    "#{Rails.root}/public/IndexContentMetadata.xls",
	    filename: "IndexContentMetadata.xls",
	    type: "application/xls"
	  )
	end

	def dashboard
		publisher = Publisher.pluck(:publisher_name)
		temp = []
		publisher.each do |pub|
			temp << Publisher.where(publisher_name: pub).last.books_primary_content_informations.count
		end
		@data = publisher.zip(temp)
	end

  def index
  end
end
