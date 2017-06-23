class HomesController < ApplicationController
 protect_from_forgery
 skip_before_action :verify_authenticity_token

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
      @books = @publisher.books_primary_content_informations.paginate(:page => params[:page], :per_page => 10)
    else
      @books = @publisher.books_primary_content_informations.joins(:books_contributor).where("first_name LIKE ?", "%#{params[:letter]}%").paginate(:page => params[:page], :per_page => 10)
    end
  end
  def books_by_title
    if !params[:letter].present?
      @books = @publisher.books_primary_content_informations.paginate(:page => params[:page], :per_page => 10)
    else
      @books = @publisher.books_primary_content_informations.where("book_title LIKE ?", "%#{params[:letter]}%").paginate(:page => params[:page], :per_page => 10)
    end
  end

  def get_search_results
    if params[:sort_by] == 'author'
      sort_order = "first_name asc"
    else
      sort_order = "book_title asc"
    end
   @books = @publisher.books_primary_content_informations.joins(:subject_groups,:books_content_pricing,:books_contributor).filter(params.slice(:book_title , :first_name, :isbn, :subject_group_name, :publication_date, :format)).order(sort_order).paginate(:page => params[:page], :per_page => 5)
    #@books = BooksPrimaryContentInformation.get_books_by_advance_search(params).order(sort_order).paginate(:page => params[:per_page])
  end

  def about
    @publisher_about = @publisher.about
    respond_to do |format|
      format.js
    end 
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

  def download_pdf
    req = request.domain
    send_file(
    "#{Rails.root}/public/#{req}.pdf",
    filename: "#{req}.pdf",
    disposition: "inline",
    type: "application/pdf"
    )
  end
end