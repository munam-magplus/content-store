class SubscriptionsController < ApplicationController
  
  def search
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

  def index
  end

  private
  def subscription_params
  	params.require(:subscription).permit(:subscription_id, 
    :subscription_name, :publisher, :subscription_description, 
    :subscription_category, :subject_group_name, :subject_group_code, 
    :subscription_type, :borrow_time, :number_of_books, 
    :price, :currency, :discount_percentage)
	end
end
