class SubjectGroupsController < ApplicationController
    before_action :authenticate_user!

  def new
  	@subject_group = SubjectGroup.new
  end
  
  def create
  	@subject_group = SubjectGroup.new(subject_group_params)
  	if @subject_group.save
			redirect_to subject_groups_path
		else
			render 'new'
		end
  end

  def search
    @subject_group = SubjectGroup.filter(params.slice(:publisher_id, :subject_group_name, :subject_group_code, :language))
  end

  def metadata_sheet
  end

  def associate_book
    @subject_group_id = params[:subject_group_id]
    @subject_group_name = params[:subject_group_name]
    @books = BooksPrimaryContentInformation.where(:publisher_id => params[:format])
  end

  private
  def subject_group_params
  	params.require(:subject_group).permit(:publisher_id, :subject_group_level, 
  	:subject_group_code, :subject_group_name, :guest_user_view_limit, :authentication_user_view_limit,
		:discount_percentage, :viewability_percentage, :language, :subject_group_description)
	end
end