class HomesController < ApplicationController

  protect_from_forgery
  skip_before_action :verify_authenticity_token
  before_action :set_them

  def index
    begin
      unless @publisher.books_primary_content_informations.blank? 
        if ['red_content','light_blue_content','fosteracademics'].include? @publisher.theme_name
          @books = @publisher.books_primary_content_informations.joins(:books_contributor).where('content_classification = ?', 'Featured Books')

        else
          @books = @publisher.books_primary_content_informations.joins(:books_contributor).paginate(:page => params[:page], :per_page => 10)
        end
      end
    rescue => e # catches StandardError (don't use rescue Esception => e)
      logger.error e.message
    end
  end

  def contact
    render :template => "shared/#{@publisher.theme_name}/contact"
  end

  def send_mail
    EndUserContactMailer.contact_email(@publisher ,params[:name], params[:email],params[:subject], params[:message]).deliver_now
    redirect_to homes_path, notice: 'Message sent'
  end
  
  def books_by_author
    @books = @publisher.books_primary_content_informations.joins(:books_contributor).where('first_name = ? AND last_name = ?',"#{params[:format].split()[0]}","#{params[:format].split()[1]}").paginate(:page => params[:page], :per_page => 10).order('book_title ASC')
    ids =[]
    get_book_ids(@books, ids)
    @ids = ids
    render :template => "shared/#{@publisher.theme_name}/books_by_author"
  end

  def get_author
    @books = @publisher.books_primary_content_informations.joins(:books_contributor).where("substr(first_name,1,1) IN (?)",params[:letter]).order('first_name ASC')
    authors = []
    @letter = params[:letter]
    @books.each do |book|
      if !authors.include?((book.books_contributor.first_name.presence || "") + " " + (book.books_contributor.last_name.presence || ""))
        authors << (book.books_contributor.first_name.presence || "") + " " + (book.books_contributor.last_name.presence || "")
      end
      @authors = authors
    end
    render :template => "shared/#{@publisher.theme_name}/get_author"
  end  

    
  
  def books_by_title
    if !params[:letter].present?
      # for all the books of requested Domain.
      @letter = 'All'
      @books = @publisher.books_primary_content_informations.paginate(:page => params[:page], :per_page => 10).order('book_title ASC')
    else
      #books by slected letter
      @books = @publisher.books_primary_content_informations.where("substr(book_title,1,1) IN (?)",params[:letter]).paginate(:page => params[:page], :per_page => 10).order('book_title ASC')
      @letter = params[:letter]
    end

    render :template => "shared/#{@publisher.theme_name}/books_by_title"

  end
  
  def refine_search_by_subject
    @subject = Subject.find(params[:subject_id])
    subjectbook = @subject.subject_groups
    subjectbook.each do |subbook| 
      @books = subbook.books_primary_content_informations.joins(:books_contributor).where('book_title LIKE ? OR first_name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 10)
    end
    respond_to do |format|
      format.js
    end 
  end

  def refine_search
    @subject_group = SubjectGroup.find(params[:subject_group_id])
    @books = @subject_group.books_primary_content_informations.joins(:books_contributor).where('book_title LIKE ? OR first_name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.js
    end 
  end

  def refine_publishers_book
    @books = BooksPrimaryContentInformation.where(id: params[:book_ids].split(' ')).book_title(params[:book_title]).paginate(:page => params[:page], :per_page => 10)
  end

  def get_search_results
    sort_column = params[:sort_by]
    sort_order = params[:order]
    @books = @publisher.books_primary_content_informations.joins(:subject_groups,:books_contributor).filter(params.slice(:book_title , :first_name, :isbn, :subject_group_name, :publication_date_from, :publication_date_to)).order(sort_column + " " + sort_order).paginate(:page => params[:page], :per_page => params[:per_page])
    books_ids =[]
    get_book_ids(@books,books_ids)
    @ids = books_ids
  end

  def about
    @publisher_about = @publisher.about
    render :template => "shared/#{@publisher.theme_name}/about" 
  end

  def terms_and_conditions
    @publisher_terms = @publisher.terms_and_conditions
    render :template => "shared/#{@publisher.theme_name}/terms_and_conditions" 
  end

  def policy
    @publisher_policy = @publisher.policy
    render :template => "shared/#{@publisher.theme_name}/policy"  
  end

  def advance_search
  end
  
  def search
    @books = @publisher.books_primary_content_informations.get_books(params[:book_title]).paginate(:page => params[:page], :per_page => 10).order('book_title ASC')
    books_ids =[]
    get_book_ids(@books,books_ids)
    @ids = books_ids
    respond_to do |format|
      format.js
    end 
  end

  def books_description
    @book_information = BooksPrimaryContentInformation.find(params[:book_id])
    render :template => "shared/#{@publisher.theme_name}/books_description"
  end

  def books_by_category
    @subject_group = SubjectGroup.find(params[:subject_group_id])
    @books = @subject_group.books_primary_content_informations.paginate(:page => params[:page], :per_page => 10)
    render :template => "shared/#{@publisher.theme_name}/books_by_category"
  end

  def books_by_subject
    @subject = Subject.find(params[:subject])
    subjectbook = @subject.subject_groups
    subjectbook.each do |subbook| 
      @books = subbook.books_primary_content_informations.paginate(:page => params[:page], :per_page => 10)
    end
    render :template => "shared/#{@publisher.theme_name}/books_by_subject"
    
  end

  def get_book_ids(books,books_ids)
    books.each do|f|
     books_ids << f.id
    end   
  end

  def catalogue
    req = @publisher.domain_name
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