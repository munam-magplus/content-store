class SubjectGroupsController < ApplicationController

  def new
  	@subject_group = SubjectGroup.new
  end
  
  def create
    byebug
  	@subject_group = SubjectGroup.new(subject_group_params)
  	if @subject_group.save
			redirect_to new_subject_group_path
		else
			render 'new'
		end
  end

  def search
  end

  def metadata_sheet
  end

  private
  def subject_group_params
  	params.require(:subject_group).permit(:PUB_PUBLISHER_ID, :SUG_GROUP_DESC, 
  	:SUG_GROUP_CODE, :SUG_GROUP_NAME, :SUG_GUEST_USER_ACCESS_LIMIT, :SUG_AUTH_USER_ACCESS_LIMIT,
		:SUG_DISCOUNT_PERCENTAGE, :SUG_VIEWING_LIMIT_PERCENTAGE, :CREATED_BY, :LASTUPDATED_BY, :LAN_LANGUAGE_ID, 
		:SHORT_DESC)
	end
end