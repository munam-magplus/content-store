class ContentConversationsController < ApplicationController
    before_action :authenticate_user!
    require "csv"

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
		publisher = Publisher.pluck(:publisher_name).last(12)
	  publisher1 = []
	  	publisher.each do |key|
			publisher1 << key
		end
		temp = []
		publisher.each do |pub|
			temp << Publisher.where(publisher_name: pub).last.books_primary_content_informations.count
		end
		@data = publisher1.zip(temp).reverse.to_json
		@institute_name = InstitutionAccount.all
	end


	def show
		@institute_id = InstitutionAccount.where(id: params[:id]) 
		@institute_name = @institute_id.last.institution_name
		@subscription_name =  @institute_id.last.subscriptions.last.subscription_name
		@subscription_count = @institute_id.last.subscriptions.last.books_primary_content_informations.count
		@isbn = @institute_id.last.subscriptions.last.books_primary_content_informations
		respond_to do |format|
  		format.xls { render template: 'content_conversations/download_quotes.xls' }
		end
	end
end
