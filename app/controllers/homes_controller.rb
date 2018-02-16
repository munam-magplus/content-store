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
          @books = @publisher.books_primary_content_informations.includes(:books_contributors).where('content_classification = ? OR content_classification = ?', 'Featured Books', 'New Releases')
        elsif ['wtbooks'].include? @publisher.theme_name
          if logged_in?
            if session[:institution_id].present?
              @institute_name = InstitutionAccount.find_by_id(session[:institution_id]["id"]).institution_name
            else
              redirect_to sign_in_homes_path
            end
          end
          if ip_logged_in?
            @institute_name = InstitutionAccount.find_by_id(params[:id]).institution_name rescue nil
          end
          @institute_id = InstitutionAccount.find_by_id(params[:id]) rescue nil
          @institute_books = InstitutionAccount.where(id: session[:institution_account_id]).last.subscriptions.all.map(&:books_primary_content_informations) rescue nil
          @books = @publisher.books_primary_content_informations.includes(:books_contributors).where('true').distinct.paginate(:page => params[:page], :per_page => 18) rescue nil  
        else
          @books = @publisher.books_primary_content_informations.paginate(:page => params[:page], :per_page => 10) rescue nil
        end
      end
    rescue => e # catches StandardError (don't use rescue Esception => e)
      logger.error e.message
    end
  end

  def subscribes_books
    #session[:institution_account_id]
    if ['wtbooks'].include? @publisher.theme_name
      if logged_in?
        @institute_name = InstitutionAccount.find_by_id(session[:institution_id]["id"]).institution_name 
        @institute_books = InstitutionAccount.where(id: session[:institution_id]["id"]).last.subscriptions.all.map(&:books_primary_content_informations).last.paginate(:page => params[:page], :per_page => 18)   
      else
        @institute_id = InstitutionAccount.find_by_id(session[:institution_account_id])
        @institute_name =  InstitutionAccount.where(id: session[:institution_account_id]).last.institution_name rescue nil
        if InstitutionAccount.where(id: session[:institution_account_id]).last.subscriptions.present?
          @institute_books = InstitutionAccount.where(id: session[:institution_account_id]).last.subscriptions.all.map(&:books_primary_content_informations).last.paginate(:page => params[:page], :per_page => 18)  
        else
          redirect_to :back
        end
      end
    end
  end

  def contact
    @institute_name = InstitutionAccount.find_by_id(params[:id]).institution_name rescue nil
    render :template => "shared/#{@publisher.theme_name}/contact"
  end


  def institution_edit
    if ['wtbooks'].include? @publisher.theme_name
      @institution_profile = InstitutionAccount.find_by_id(session[:institution_account_id]) 
      @institute_name =  InstitutionAccount.where(id: session[:institution_account_id]).last.institution_name  rescue nil
    end
  end

  def update
    @institution = InstitutionAccount.where(id: session[:institution_account_id]).last
    @institute_name =  InstitutionAccount.where(id: session[:institution_account_id]).last.institution_name 
    if @institution.update(institution_params_values)  
      redirect_to :back
    end
  end

  def send_mail
    EndUserContactMailer.contact_email(@publisher ,params[:name], params[:email],params[:subject], params[:message]).deliver_now
    redirect_to homes_path, notice: 'Message sent'
  end
  
  def books_by_author
    if ip_logged_in?
      @institute_name =  InstitutionAccount.where(id: session[:institution_account_id]).last.institution_name  rescue nil
    end
      @books = @publisher.books_primary_content_informations.joins(:books_contributors).where('first_name = ? AND last_name = ?',"#{params[:format].split()[0]}","#{params[:format].split()[1]}").paginate(:page => params[:page], :per_page => 10).order('book_title ASC')
      ids =[]
      get_book_ids(@books, ids)
      @ids = ids
      render :template => "shared/#{@publisher.theme_name}/books_by_author"
  end

    def get_author
      if ip_logged_in?
        @institute_name = InstitutionAccount.find_by_id(params[:institution_id]).institution_name rescue nil
      end
      auth = @publisher.books_primary_content_informations.joins(:books_contributors).where("substr(first_name,1,1) IN (?)",params[:letter]).order('first_name ASC').pluck(:first_name,:last_name)
      authors = []
      @letter = params[:letter]
      auth.each do |f|
        if !authors.include?((f[0].presence || "") + " " + (f[1].presence || ""))
          authors << (f[0].presence || "") + " " + (f[1].presence || "")   
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
      @books = subbook.books_primary_content_informations.joins(:books_contributors).where('book_title LIKE ? OR first_name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 10)
    end
    respond_to do |format|
      format.js
    end 
  end

  def refine_search
    @subject_group = SubjectGroup.find(params[:subject_group_id])
    @books = @subject_group.books_primary_content_informations.joins(:books_contributors).where('book_title LIKE ? OR first_name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 10)
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
     @books = @publisher.books_primary_content_informations.joins(:subject_groups,:books_contributors).filter(params.slice(:book_title , :first_name, :isbn, :subject_group_name, :publication_date_from, :publication_date_to)).order(sort_column + " " + sort_order).paginate(:page => params[:page], :per_page => params[:per_page])
    books_ids =[]
    get_book_ids(@books,books_ids)
    @ids = books_ids
  end

  def about
    @institute_name = InstitutionAccount.find_by_id(params[:id]).institution_name rescue nil
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

  def show
    redirect_to homes_path
  end

  def books_description  
    if ip_logged_in?
      if ['wtbooks'].include? @publisher.theme_name
        @institute_name = InstitutionAccount.find_by_id(session[:institution_account_id]).institution_name
        subscription = InstitutionAccount.find(session[:institution_account_id]).subscriptions.all.map(&:subscription_books) 
        subscription.reject(&:empty?).each do |sbooks| 
          @subscriptionn = sbooks.where(books_primary_content_information_id: params[:book_id])
        end
        @has_subscription = @subscriptionn
      end
    end
    if logged_in?
      if ['wtbooks'].include? @publisher.theme_name
        @institute_name = InstitutionAccount.find_by_id(session[:institution_id]["id"]).institution_name
        subscription = InstitutionAccount.find_by_id(session[:institution_id]["id"]).subscriptions.all.map(&:subscription_books) 
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

  def wt_books_description
     if ip_logged_in?
      if ['wtbooks'].include? @publisher.theme_name
        @institute_name = InstitutionAccount.find_by_id(session[:institution_account_id]).institution_name
        subscription = InstitutionAccount.find(session[:institution_account_id]).subscriptions.all.map(&:subscription_books) 
        subscription.reject(&:empty?).each do |sbooks| 
          @subscriptionn = sbooks.where(books_primary_content_information_id: params[:book_id])
        end
        @has_subscription = @subscriptionn
      end
    end
    if logged_in?
      if ['wtbooks'].include? @publisher.theme_name
        @institute_name = InstitutionAccount.find_by_id(session[:institution_id]["id"]).institution_name
        subscription = InstitutionAccount.find_by_id(session[:institution_id]["id"]).subscriptions.all.map(&:subscription_books) 
        subscription.reject(&:empty?).each do |sbooks| 
          @subscriptionn = sbooks.where(books_primary_content_information_id: params[:book_id])
        end
        @has_subscription = @subscriptionn
      end
    end
      @book_information = BooksPrimaryContentInformation.find(params[:book_id])
      @book_subject_group = @book_information.subject_groups.first
      render :template => "shared/#{@publisher.theme_name}/wt_books_description"
  end

  def books_by_category
    @subject_group = SubjectGroup.find(params[:subject_group_id])
    @books = @subject_group.books_primary_content_informations.paginate(:page => params[:page], :per_page => 10)
    render :template => "shared/#{@publisher.theme_name}/books_by_category"
  end

  def books_by_subject
    #@subject = Subject.find(params[:subject])
    if ip_logged_in?
     @institute_name = InstitutionAccount.find_by_id(session[:institution_account_id]).institution_name
    end
    @subject = Subject.find(params[:subject])
    @books1 = Subject.find(params[:subject]).subject_groups
    @books = @books1.includes(:books_primary_content_informations).all.map(&:books_primary_content_informations).flatten(1).uniq.paginate(:page => params[:page], :per_page => 10)
    render :template => "shared/#{@publisher.theme_name}/books_by_subject" 
  end

  def wt_categories
    if ip_logged_in?
      @institute_name = InstitutionAccount.find_by_id(session[:institution_account_id]).institution_name
    end
    @type = params[:subject]
    @subjects = @publisher.subjects.where(subject_classification: params[:subject])
    render :template => "shared/#{@publisher.theme_name}/wt_categories" 
  end

  def permission_check_for_books
    if logged_in?
      @result = true
    else
      redirect_to sign_in_homes_path
    end
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
    if request.host == "ebooks.wtbooks.com"
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
    if request.host == "ebooks.wtbooks.com"
      pub_domain = request.host
      unless pub_domain.start_with?('www')
        pub_domain = request.host 
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
    # end    
  end

  def redirect_if_subscriptions
    if request.host == "ebooks.wtbooks.com" 
      if params[:page].present?
        @books = @publisher.books_primary_content_informations.joins(:books_contributor).paginate(:page => params[:page], :per_page => 10) rescue nil
        return homes_index_path
      end
      IpAddress.all.each do |ip_add|
        low =  (ip_add.low_ip).to_i
        high = (ip_add.high_ip).to_i
        request_ip = IPAddr.new(request.remote_ip).to_i
        if (low..high) === request_ip
          end_user_ip = IpAddress.find_by(low_ip: request_ip)
          if end_user_ip
            log_in_ip end_user_ip
          end
        end
      end
    end
  end

  def institution_params_values
    params.require(:institution_account).permit(:publisher_id,:institution_id, :institution_name) 
  end

  def end_user_params
    params.require(:end_user).permit(:publisher_id, :email, :password, 
    :confirm_password, :first_name, :last_name, :country_code, :institution_account_id)
  end
end

