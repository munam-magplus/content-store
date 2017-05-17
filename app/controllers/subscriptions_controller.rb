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
    respond_to do |format|
      if @subscription.save!
        add_subscription_id_for_subject_group
        format.html {render "new" }
        format.js   { }
      else
        render 'new'
      end
    end
  end
  
  def add_subscription_id_for_subject_group
    ids = params[:subscription][:role_ids].first
    ids = ids.split(',').map(&:squish)
    ids.each do |id|
     @subject_group_id = SubscriptionForSubjectGroup.new
     @subject_group_id.subject_group_id = @subscription.id
     @subject_group_id.subscription_id = ids[id.to_i - 1]
     @subject_group_id.save!
    end
  end

  def index
  end

  private
  def subscription_params
  	params.require(:subscription).permit(:subscription_id, :subscription_name, 
    :publisher_id, :subscription_description, :subscription_category, 
    :subscription_type, :agreement_from, :agreement_to, :available_for_institutional_account, 
    :purchase_information_number_of_books, :purchase_information_price,
    :purchase_information_discount_percentage)
	end
end
