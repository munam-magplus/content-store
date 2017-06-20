class SubjectsController < ApplicationController
  def new
  	@subject = Subject.new
  end

  def create
  	@subject = Subject.new(subject_params)
  	if @subject.save
			redirect_to subjects_path
		else
			render 'new'
		end
  end

  def index
  end

  def search
    @subject = Subject.filter(params.slice(:publisher_id, :subject_name))
  end

  private
  def subject_params
  	params.require(:subject).permit(:publisher_id, :subject_name)
	end
end
