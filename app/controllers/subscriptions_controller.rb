class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def subject_group_search
    # search for the Subject Group at the time of Subject Group creation
    @subject_group_search = SubjectGroup.filter(params.slice(:subject_group_name, :subject_group_code))
  end

  def title_search
    # search for the Title at the time of Title creation
    isbn_book_info = params[:isbn].split
    if isbn_book_info.count == 1 || params[:book_title].present?
      @title_search = BooksPrimaryContentInformation.filter(params.slice(:isbn, :book_title, :file_name, :publication_year))
    else
      @title_search = BooksPrimaryContentInformation.where(isbn: isbn_book_info)
    end
  end

  def new
    @subscription = Subscription.new
  end

  def search
    @subscription = Subscription.filter(params.slice(:publisher_id, :subscription_name, :available_for_institutional_accounts, :subscription_category))
  end
  
  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save! && params[:value] == "Subject Group"
      add_subscription_for_subject_group
      redirect_to subscriptions_path
    elsif @subscription.save! && params[:value] == "Book"
      add_subscription_for_book  
      redirect_to subscriptions_path
    else
      redirect_to new_subscription_path
    end
  end
  
  def add_subscription_for_subject_group
    role_ids = params[:subscription][:role_ids]
    new_role_ids = []
    role_ids.each do |role_id|
      new_role_id = role_id.split(',').map(&:squish)
      new_role_ids << new_role_id
    end
    new_role_ids.flatten.each do |role_id|
      @subject_group_id = SubscriptionBook.new
      @subject_group_id.subscription_id = @subscription.id
      @subject_group_id.subject_group_id = role_id
      @subject_group_id.save!
    end
  end

  def add_subscription_for_book
    role_ids = params[:subscription][:role_ids]
    new_role_ids = []
    role_ids.each do |role_id|
      new_role_id = role_id.split(',').map(&:squish)
      new_role_ids << new_role_id
    end
    new_role_ids.flatten.each do |role_id|
      @book_id = SubscriptionBook.new
      @book_id.subscription_id = @subscription.id
      @book_id.books_primary_content_information_id = role_id
      @book_id.save!
    end
  end

  def condition_one
  end

  def condition_two
  end

  def condition_three
  end

  def condition_four
  end

  def index
    #Call filter method to get search results
    @subscription = Subscription.filter(params.slice(:publisher_id, :email, :last_name, :country_code))
  end

  def view
    @end_user_id = params[:end_user_id]
    @end_user_first_name = params[:end_user_first_name]
    @end_user_last_name = params[:end_user_last_name]
    @subscriptions = Subscription.all
  end

  def metadata_sheet
  end

  def associate_subscription_with_books
  end

  def import_for_subscription
    #  In this method,we get the entire Excel file in params.
    # in params[:file], we get the path of the excel file.
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    # we fetch first row elements( that act as column names of table) in header
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # we get excel's row elements(that are attributes of table) in header
      # and in spreadsheet.row(i) we get data for record
      # here we transpose inorder to map each column and data for record insertion
      @subscriptions = Subscription.new
      @subscriptions.attributes = row.to_hash.slice(*row.to_hash.keys)
      @subscriptions.save!
    end
    redirect_to :back
  end

  def import
    #  In this method,we get the entire Excel file in params.
    # in params[:file], we get the path of the excel file.
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    # we fetch first row elements( that act as column names of table) in header
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # we get excel's row elements(that are attributes of table) in header
      # and in spreadsheet.row(i) we get data for record
      # here we transpose inorder to map each column and data for record insertion
      @subscriptionbooks = SubscriptionBook.new
      @subscriptionbooks.attributes = row.to_hash.slice(*row.to_hash.keys)
      @subscriptionbooks.save!
    end
    redirect_to :back
  end

  def import_for_subscription_institute
    #  In this method,we get the entire Excel file in params.
    # in params[:file], we get the path of the excel file.
    spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    # we fetch first row elements( that act as column names of table) in header
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # we get excel's row elements(that are attributes of table) in header
      # and in spreadsheet.row(i) we get data for record
      # here we transpose inorder to map each column and data for record insertion
      @subscriptioninstitutes = SubscriptionInstitute.new
      @subscriptioninstitutes.attributes = row.to_hash.slice(*row.to_hash.keys)
      @subscriptioninstitutes.save!
    end
    redirect_to :back
  end

  def open_spreadsheet(file)
     #  the details of Excel sheet are holded in file
    case File.extname(file.original_filename)
      # in file.original_filename, we get the name of the excel sheet.
      #  the File.extname is a method that is used to fetch the extension 
      # of file
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
     # in file.path,we get the path in which the excel sheet is stored
     # Roo:Spreadsheet.open(file.path, extension: :xls) helps us to open the 
     # Excel Spreadsheet
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private
  def subscription_params
    params.require(:subscription).permit(:publisher_id, :subscription_id, 
    :subscription_name, :subscription_description, :subscription_category, 
    :subscription_type, :agreement_form, :agreement_to, :role_ids,
    :available_for_institutional_account, :purchase_information_price,
    :purchase_information_number_of_books, 
    :purchase_information_discount_percentage)
  end
end