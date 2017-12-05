require 'ipaddr'
require 'will_paginate/array'
class HomesController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token
  before_action :set_them
  before_action :redirect_if_subscriptions, only: [:index] 

  def index
    begin
      unless @publisher.books_primary_content_informations.blank? 
        if ['red_content','light_blue_content','fosteracademics'].include? @publisher.theme_name
          @books = @publisher.books_primary_content_informations.joins(:books_contributor).where('content_classification = ? OR content_classification = ?', 'Featured Books', 'New Releases')
        elsif ['wtbooks'].include? @publisher.theme_name
          @institute_name = InstitutionAccount.find_by_id(params[:id]).institution_name rescue nil
          @institute_id = InstitutionAccount.find_by_id(params[:id]) rescue nil
          @institute_books = InstitutionAccount.find_by_id(params[:id]).subscriptions.all.map(&:books_primary_content_informations) rescue nil 
          @books = @publisher.books_primary_content_informations.joins(:books_contributor).paginate(:page => params[:page], :per_page => 4) rescue nil 
        else
          @books = @publisher.books_primary_content_informations.joins(:books_contributor).paginate(:page => params[:page], :per_page => 10) rescue nil
        end
      end
    rescue => e # catches StandardError (don't use rescue Esception => e)
      logger.error e.message
    end
  end

  def subscribes_books
    if ['wtbooks'].include? @publisher.theme_name
      @institute_id = InstitutionAccount.find_by_id(params[:institution_id])
      @institute_name =  InstitutionAccount.where(id: params[:institution_id]).last.institution_name rescue nil
      @institute_books = InstitutionAccount.where(id: params[:institution_id]).last.subscriptions.all.map(&:books_primary_content_informations).paginate(:page => params[:page], :per_page => 1) rescue nil
   



       #@ratings = OpinionRating.agreed.for(params[:id]).includes(:profile)
       #@profiles = @ratings.collect(&:profile)
       #@institute_books = .where(id: params[:institution_id]).last.subscriptions.all.map(&:books_primary_content_informations)

      #@inst_books =
      #@books = @publisher.books_primary_content_informations.joins(:books_contributor).paginate(:page => params[:page], :per_page => 18)
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
    if params[:institution_id].present?
      if ['wtbooks'].include? @publisher.theme_name
        subscription = InstitutionAccount.find(params[:institution_id]).subscriptions.all.map(&:subscription_books) 
        subscription.reject(&:empty?).each do |sbooks| 
          @subscriptionn = sbooks.where(books_primary_content_information_id: params[:book_id])
        end
        @has_subscription = @subscriptionn
      end
    end
    @book_information = BooksPrimaryContentInformation.find(params[:book_id])
    @book_subject_group = @book_information.subject_groups.first
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

  def permission_check_for_books
    if logged_in?
      @result = true
    else
      redirect_to sign_in_homes_path
    end
  end

  # def book_reader
  #   @book_information = BooksPrimaryContentInformation.find(params[:book_id])
  #   @isbn = @book_information.isbn
  # end

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

  def sign_in
    render :template => "shared/#{@publisher.theme_name}/sign_in"
  end

  def login
    end_user = EndUser.find_by(email: params[:session][:email].downcase)
    if end_user && end_user.authenticate(params[:session][:password])
      log_in end_user
      redirect_to homes_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render :template => "shared/#{@publisher.theme_name}/sign_in"
    end
  end

  def registration
    @end_user = EndUser.new
    @subject_group = @publisher.subject_groups
    publisher_id = @publisher.id
    render :template => "shared/#{@publisher.theme_name}/registration"
  end

  def sign_up
    @end_user = EndUser.new(end_user_params)
    if verify_recaptcha(model: @end_user) && @end_user.save
      render :template => "shared/#{@publisher.theme_name}/sign_in"
    else
      render :template => "shared/#{@publisher.theme_name}/registration"
    end
  end

  def logout
    log_out
    redirect_to root_url
  end

  def current_user
    @current_end_user ||= EndUser.find_by(id: session[:end_user_id])
    render :template => "shared/#{@publisher.theme_name}/my_profile"
  end

  private

  def set_them
    if request.host == "wtbooks.mpstechnologies.com"
      set_them_wtbooks
      else  
        if request.domain.present?
         pub_domain = request.domain
          unless pub_domain.start_with?('www')
            pub_domain = 'www' + '.'  +  request.domain 
          end
        begin
          @gethost = pub_domain.split('.')[1]
          @publisher = Publisher.find_by_domain_name(@gethost)
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


   def set_them_wtbooks
    if request.host == "wtbooks.mpstechnologies.com"
      pub_domain = request.host
      unless pub_domain.start_with?('www')
          pub_domain = request.host 
      end
     begin
      @gethost = pub_domain.split('.')[0]
      @publisher = Publisher.find_by_domain_name(@gethost)
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
    # end    
  end

  def redirect_if_subscriptions
    if request.host == "wtbooks.mpstechnologies.com" 
      if params[:page].present?
        @books = @publisher.books_primary_content_informations.joins(:books_contributor).paginate(:page => params[:page], :per_page => 10) rescue nil
        return homes_index_path
      end
      IpAddress.all.each do |ip_add|
        low =  (ip_add.low_ip).to_i
        high = (ip_add.high_ip).to_i
        request_ip = IPAddr.new(request.remote_ip).to_i
        if (low..high) === request_ip
          redirect_to root_path(id: ip_add.institution_account_id)  unless request.fullpath == root_path(id: ip_add.institution_account_id)
        end
      end
    end
  end

  def end_user_params
    params.require(:end_user).permit(:publisher_id, :email, :password, 
    :confirm_password, :first_name, :last_name, :country_code)
  end
end