class HomesController < ApplicationController

  protect_from_forgery
  skip_before_action :verify_authenticity_token
  before_action :set_them

  def index
    begin
      unless @publisher.books_primary_content_informations.blank?
        @books = @publisher.books_primary_content_informations.joins(:books_contributor).paginate(:page => params[:page], :per_page => 3)
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
    @ids = @publisher.subject_groups
    @books = BooksPrimaryContentInformation.joins(:books_contributor).where('first_name = ? AND last_name = ?',"#{params[:first_name]}","#{params[:last_name]}").paginate(:page => params[:page], :per_page => 10)
  end

  def syrawood_books_by_author
    @ids = @publisher.subject_groups
    @books = BooksPrimaryContentInformation.joins(:books_contributor).where('first_name = ? AND last_name = ?',"#{params[:first_name]}","#{params[:last_name]}").paginate(:page => params[:page], :per_page => 10)
  end

  def get_author
    @books = @publisher.books_primary_content_informations.joins(:books_contributor).where("substr(first_name,1,1) IN (?)",params[:letter]).paginate(:page => params[:page], :per_page => 10)
  end

  def syrawood_get_author
    @books = @publisher.books_primary_content_informations.joins(:books_contributor).where("substr(first_name,1,1) IN (?)",params[:letter]).paginate(:page => params[:page], :per_page => 10)
  end
  
  def books_by_title
    @books = @publisher.books_primary_content_informations.where("substr(book_title,1,1) IN (?)",params[:letter]).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.js
    end
  end

  def syrawood_books_by_title
    @books = @publisher.books_primary_content_informations.where("substr(book_title,1,1) IN (?)",params[:letter]).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.js
    end
  end

  def refine_search_by_subject
    @subject = Subject.find(params[:subject_id])
    subjectbook = @subject.subject_groups
    subjectbook.each do |subbook| 
      @books = subbook.books_primary_content_informations.joins(:books_contributor).where('book_title LIKE ? OR first_name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 1)
    end
    respond_to do |format|
      format.js
    end 
  end

  def refine_search
    @subject_group = SubjectGroup.find(params[:subject_group_id])
    @books = @subject_group.books_primary_content_informations.joins(:books_contributor).where('book_title LIKE ? OR first_name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 1)
    respond_to do |format|
      format.js
    end 
  end

  def refine_publishers_book
    @books = BooksPrimaryContentInformation.where(id: params[:book_ids].split(' '), book_title: params[:book_title]).paginate(:page => params[:page], :per_page => 10)
      respond_to do |format|
        format.js
      end 
  end

  def get_search_results
    if params[:sort_by] == 'author'
      sort_order = "first_name asc"
    else
      sort_order = "book_title asc"
    end
    @books = @publisher.books_primary_content_informations.joins(:subject_groups,:books_content_pricing,:books_contributor).filter(params.slice(:book_title , :first_name, :isbn, :subject_group_name, :publication_date, :format)).order(sort_order).paginate(:page => params[:page], :per_page => 5)
    @ids = @publisher.subject_groups
  end

  def about
    @publisher_about = @publisher.about
    respond_to do |format|
      format.js
    end 
  end

  def terms_and_conditions
    @publisher_terms = @publisher.terms_and_conditions
    respond_to do |format|
      format.js
    end 
  end

  def policy
    @publisher_policy = @publisher.policy
    respond_to do |format|
      format.js
    end 
  end

  def advance_search
  end
  
  def search
    @books = @publisher.books_primary_content_informations.filter(params.slice(:book_title)).paginate(:page => params[:page], :per_page => 5)
    books_ids =[]
    get_book_ids(@books,books_ids)
    @ids = books_ids
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
    @subject_group = SubjectGroup.find(params[:subject_group_id])
    @books = @subject_group.books_primary_content_informations.paginate(:page => params[:page], :per_page => 1)
    respond_to do |format|
      format.js
    end     
  end

  def books_by_subject
    @subject = Subject.find(params[:subject])
    subjectbook = @subject.subject_groups
    subjectbook.each do |subbook| 
      @books = subbook.books_primary_content_informations.paginate(:page => params[:page], :per_page => 1)
    end
    respond_to do |format|
      format.js
    end
  end

  def get_book_ids(books,books_ids)
    books.each do|f|
     books_ids << f.id
    end   
  end

  def download_pdf
    req = request.domain
    send_file(
    "#{Rails.root}/vendor/#{req}.pdf",
    filename: "#{req}.pdf",
    disposition: "inline",
    type: "application/pdf"
    )
  end

  private

  def set_them
    if request.domain.present? && request.domain != 'www' && request.domain != 'localhost'
      begin
        @gethost = request.host.split('.')[0]
        @publisher = Publisher.find_by_domain_name!(@gethost)
        unless @publisher.blank?
          unless @publisher.theme_name.blank?
            @css_root = "#{@publisher.theme_name}/application"
          else
            @css_root = "default_theme/application"
          end  
        end
      rescue ActiveRecord::RecordNotFound
        
      end
    else
     redirect_to users_sign_in_path  
    end
  end

end