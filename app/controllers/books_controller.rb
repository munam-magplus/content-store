class BooksController < ApplicationController
	def new
		session[:book_params] ||= {}
  	@book = BookContent.new(session[:book_params])
  	@book.current_step = session[:book_step]
	end

  def create
  	session[:book_params].deep_merge!(params[:book]) if params[:book]
  	@book = BookContent.new(session[:book_params])
  	@book.current_step = session[:book_step]
  	if params[:back_button]
  		@book.previous_step
  	else
  		@book.next_step
  	end
  	session[:book_step] = @book.current_step
  	render 'new'
  end

  def create_hello
  	@book = BookContent.new()
  	if @book.save
			redirect_to book_path
		else
			render 'new'
		end
  end

  def search
  end

  private
  def primary_content_info_params
  	params.require(:subject_group).permit(:PUB_PUBLISHER_ID, :SUG_GROUP_DESC, 
  		:SUG_GROUP_CODE, :SUG_GROUP_NAME, :SUG_GUEST_USER_ACCESS_LIMIT, :SUG_AUTH_USER_ACCESS_LIMIT,
		:SUG_DISCOUNT_PERCENTAGE, :SUG_VIEWING_LIMIT_PERCENTAGE, :CREATED_BY, :LASTUPDATED_BY, :LAN_LANGUAGE_ID, 
		:SHORT_DESC)
	end

	def contributors_params
  	params.require(:subject_group).permit(:PUB_PUBLISHER_ID, :SUG_GROUP_DESC, 
  		:SUG_GROUP_CODE, :SUG_GROUP_NAME, :SUG_GUEST_USER_ACCESS_LIMIT, :SUG_AUTH_USER_ACCESS_LIMIT,
		:SUG_DISCOUNT_PERCENTAGE, :SUG_VIEWING_LIMIT_PERCENTAGE, :CREATED_BY, :LASTUPDATED_BY, :LAN_LANGUAGE_ID, 
		:SHORT_DESC)
	end

	def content_pricing_params
  	params.require(:subject_group).permit(:PUB_PUBLISHER_ID, :SUG_GROUP_DESC, 
  		:SUG_GROUP_CODE, :SUG_GROUP_NAME, :SUG_GUEST_USER_ACCESS_LIMIT, :SUG_AUTH_USER_ACCESS_LIMIT,
		:SUG_DISCOUNT_PERCENTAGE, :SUG_VIEWING_LIMIT_PERCENTAGE, :CREATED_BY, :LASTUPDATED_BY, :LAN_LANGUAGE_ID, 
		:SHORT_DESC)
	end

	def content_access_rules_params
  	params.require(:subject_group).permit(:PUB_PUBLISHER_ID, :SUG_GROUP_DESC, 
  		:SUG_GROUP_CODE, :SUG_GROUP_NAME, :SUG_GUEST_USER_ACCESS_LIMIT, :SUG_AUTH_USER_ACCESS_LIMIT,
		:SUG_DISCOUNT_PERCENTAGE, :SUG_VIEWING_LIMIT_PERCENTAGE, :CREATED_BY, :LASTUPDATED_BY, :LAN_LANGUAGE_ID, 
		:SHORT_DESC)
	end

	def seo_config_params
  	params.require(:subject_group).permit(:PUB_PUBLISHER_ID, :SUG_GROUP_DESC, 
  		:SUG_GROUP_CODE, :SUG_GROUP_NAME, :SUG_GUEST_USER_ACCESS_LIMIT, :SUG_AUTH_USER_ACCESS_LIMIT,
		:SUG_DISCOUNT_PERCENTAGE, :SUG_VIEWING_LIMIT_PERCENTAGE, :CREATED_BY, :LASTUPDATED_BY, :LAN_LANGUAGE_ID, 
		:SHORT_DESC)
	end
end

