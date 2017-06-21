class HomesController < ApplicationController
 protect_from_forgery
 skip_before_action :verify_authenticity_token

  before_action :get_host
  def index
    begin
    unless @publisher.books_primary_content_informations.blank?
      @books = @publisher.books_primary_content_informations.paginate(:page => params[:page], :per_page => 10)
    end
    rescue => e # catches StandardError (don't use rescue Esception => e)
      logger.error e.message
    end
  end

  def contact
  end

  def send_mail
    EndUserContactMailer.contact_email(@publisher ,params[:name], params[:email],params[:subject], params[:message]).deliver_now
    redirect_to homes_path, notice: 'Message sent'
  end
  
  def books_by_author
    if !params[:letter].present?
      @books = BooksPrimaryContentInformation.all.paginate(:page => params[:page], :per_page => 2)
    else
      @books = BooksPrimaryContentInformation.find_by_first_letter(params[:letter]).paginate(:page => params[:page], :per_page => 2)
    end
  end

  def get_search_results
    @books = BooksPrimaryContentInformation.get_books_by_advance_search
  end
  def about
    @publisher_about = @publisher.about
  end

  def terms_and_conditions
    @publisher_terms = @publisher.terms_and_conditions
  end

  def policy
    @publisher_policy = @publisher.policy
  end

  def advance_search
  end
  
  def search
    @books = @publisher.books_primary_content_informations.filter(params.slice(:book_title)).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.js
    end 
  end

  def books_description
    @book_information = BooksPrimaryContentInformation.find(params[:book_id])
    respond_to do |format|
      format.js
    end 
  end

  def books_by_category
    subject_group = SubjectGroup.find(params[:subject_group_id])
    @books = subject_group.books_primary_content_informations.paginate(:page => params[:page], :per_page => 3)
    respond_to do |format|
      format.js
    end     
  end

  private
  def get_host
    begin
    @gethost = request.host.split('.')[0] + '.' + 'com'
    @publisher = Publisher.find_by_domain_name!(@gethost)
    rescue ActiveRecord::RecordNotFound
      redirect_to users_sign_in_path
    end
  end
  
end