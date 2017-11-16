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

  def search
    @subscription = Subscription.filter(params.slice(:publisher_id, :subscription_name, :available_for_institutional_accounts, :subscription_category))
  end
  
  def create
    @subscription = Subscription.new(subscription_params)
    respond_to do |format|
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
    role_ids = params[:subscription][:role_ids]
    new_role_ids = []
    role_ids.each do |role_id|
      new_role_id = role_id.split(',').map(&:squish)
      new_role_ids << new_role_id
    end
    new_role_ids.flatten.each do |role_id|
      @book_id = SubscriptionForBook.new
      @book_id.subscription_id = @subscription.id
      @book_id.title_id = role_id
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

  private
  def subscription_params
    params.require(:subscription).permit(:publisher_id, :subscription_id, :subscription_name, 
    :subscription_description, :subscription_category, 
    :subscription_type, :agreement_form, :agreement_to, :available_for_institutional_account, 
    :purchase_information_number_of_books, :purchase_information_price,
    :purchase_information_discount_percentage, :role_ids)
  end
end