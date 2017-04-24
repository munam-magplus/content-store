class MemberPublishersController < ApplicationController
	def index
	end
  def edit   
    @member_publisher = MemberPublisher.find(params[:id])
    render 'new'
  end

	def linked_member_publisher
    @member_publishers= MemberPublisher.get_member_publishers(params[:publisher_id])
	end
	def new
		@member_publisher = MemberPublisher.new
	end
	def save
    if params[:member_publisher][:id] != ""
      @member_publisher = MemberPublisher.find(params[:member_publisher][:id])
      if @member_publisher.update_attributes!(member_publisher_params)
      # Handle a successful update.
        flash[:notice] = 'Member Publisher was successfully updated.'
        redirect_to publisher_setup_index_path
      else
        render 'edit'
      end
    else
      @member_publisher = MemberPublisher.new(member_publisher_params)  
      if @member_publisher.save!
        flash[:success] = "Member Publisher was successfully created."
        # if successfully stored then redirect to publisher's setup path 
        redirect_to publisher_setup_index_path
      else
        # if not save in that case render new
        render 'new'
      end
    end
  end
  
  private 
  def member_publisher_params
    params.require(:member_publisher).permit(:publisher_id, :member_publisher_code, :member_publisher_name, 
    :member_publisher_status, :contact_first_name, :contact_last_name, :contact_email, :publisher_borrow_period, :revenue_share_percentage, :file)
  end

end
