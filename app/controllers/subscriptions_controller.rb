class SubscriptionsController < ApplicationController
      before_action :authenticate_user!

  def subject_group_search
  # search for the Subject Group at the time of Subject Group creation
  @subject_group_search = SubjectGroup.filter(params.slice(:subject_group_name, :subject_group_code))
 end

 def title_search
  # search for the Title at the time of Title creation
  @title_search = BooksPrimaryContentInfo.filter(params.slice(:isbn, :title, :file_name, :publication_year))
 end

  def new
  	@subscription = Subscription.new
  end

  def create
  	@subscription = Subscription.new(subscription_params)
    if @subscription.save!
      redirect_to new_subscription_path
    else
      render 'new'
    end
  end

  def create
  @subscription = Subscription.new(subscription_params)
   # @subscription.created_by = current_user.email
    respond_to do |format|
      if @subscription.save!
        add_subscription_for_subject_groups
        format.html {render "new" }
        format.js   { }
      else
        render 'new'
      end
    end
  end
  
  def add_subscription_for_subject_groups
    ids = params[:subscription][:role_ids].first
    ids = ids.split(',').map(&:squish)
    ids.each do |id|
     license = SubscriptionForSubjectGroup.find_by_license_id(id)
     license.license_group_id = @license_group.id
     license.save!
    end
  end

  def index
  end

  private
  def subscription_params
  	params.require(:subscription).permit(:subscription_id, :subscription_name, 
    :publisher, :subscription_description, :subscription_category, :subject_group_name, 
    :subject_group_code, :subscription_type, :borrow_time, :number_of_books, :price, 
    :currency, :discount_percentage, :duration)
	end
end
