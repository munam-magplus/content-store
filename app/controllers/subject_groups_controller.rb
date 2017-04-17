class SubjectGroupsController < ApplicationController
    before_action :authenticate_user!

  def new
  	@subject_group = SubjectGroup.new
  end
  
  def create
  	@subject_group = SubjectGroup.new(subject_group_params)
  	if @subject_group.save
			redirect_to new_subject_group_path
		else
			render 'new'
		end
  end

  def search
  end
  
  def search_result
    @subject_group = SubjectGroup.filter(params.slice(:publisher, :subject_group_name, :subject_group_code, :language))
    render :partial => 'search_result'
  end

  def metadata_sheet
  end

  private
  def subject_group_params
  	params.require(:subject_group).permit(:publisher, :subject_group_level, 
  	:subject_group_code, :subject_group_name, :guest_user_view_limit, :authentication_user_view_limit,
		:discount_percentage, :viewability_percentage, :select_language, :description)
	end
end