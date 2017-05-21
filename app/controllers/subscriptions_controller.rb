class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def subject_group_search
  # search for the Subject Group at the time of Subject Group creation
  @subject_group_search = SubjectGroup.filter(params.slice(:subject_group_name, :subject_group_code))
 end

 def title_search
  # search for the Title at the time of Title creation
  @title_search = BooksPrimaryContentInformation.filter(params.slice(:isbn, :title, :file_name, :publication_year))
 end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    respond_to do |format|
      if @subscription.save! && params[:value] == ["Subject Group"]
        add_subscription_for_subject_group
        format.html {render "new" }
        format.js   { }
      elsif @subscription.save! && params[:value] == ["Book"]
        add_subscription_for_book  
        format.html {render "new" }
        format.js   { }
      else
        render 'new'
      end
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
     @subject_group_id = SubscriptionForSubjectGroup.new
     @subject_group_id.subscription_id = @subscription.id
     @subject_group_id.subject_group_id = role_id
     @subject_group_id.save!
    end
  end

  def add_subscription_for_book
    @book_id = SubscriptionForBook.new
    @book_id.subscription_id = @subscription.id
    if params[:value1] == ["All Publishers"]
      @book_id.all_publisher = "true"
    else
      @book_id.all_publisher = "false"
    end
    if params[:value2] == ["All Titles"]
      @book_id.all_title = "true"
    else
      @book_id.all_title = "false"
    end
    if params[:value1] == ["Select Publisher"]
      selected_publisher_id = params[:subscription][:publisher_id]
      selected_publisher_id = selected_publisher_id.split(',').map(&:squish)
      selected_publisher_id.each do |step1|
        @book_id.publisher_id = selected_publisher_id[step1.to_i]
      end
    else
      @book_id.publisher_id = "nil"
    end
    if params[:value2] == ["Select Title"]
      role_ids = params[:subscription][:role_ids]
      new_role_ids = []
      role_ids.each do |role_id|
        new_role_id = role_id.split(',').map(&:squish)
        new_role_ids << new_role_id
      end
      new_role_ids.flatten.each do |role_id|
        @book_id.title_id = role_id
        @book_id.save!
      end
    else
      @book_id.title_id = "nil"
    end
    @book_id.save!
  end

  def index
  end

  private
  def subscription_params
    params.require(:subscription).permit(:subscription_id, :subscription_name, 
    :subscription_description, :subscription_category, 
    :subscription_type, :agreement_from, :agreement_to, :available_for_institutional_account, 
    :purchase_information_number_of_books, :purchase_information_price,
    :purchase_information_discount_percentage, :role_ids)
  end
end