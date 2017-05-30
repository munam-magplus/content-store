class ThemesController < ApplicationController
	
	def index
	end

	def new
	 @theme = Theme.new
	 @themes = Theme.all
	end

	def edit   
    @theme = Theme.find(params[:id])
    @themes = Theme.all
    render 'new'
  end

  def save
    unless params[:theme][:id].blank?
      @theme = Theme.find(params[:theme][:id])
      if @theme.update_attributes!(theme_params)
      # Handle a successful update.
        flash[:notice] = 'Theme Uploaded Successfully!'
        redirect_to publishers_path
      else
        render 'edit'
      end
    else
      @theme = Theme.new(theme_params)  
      if @theme.save!
        flash[:success] = "Theme Successfully Saved!"
        # if successfully stored then redirect to publisher's setup path 
        redirect_to publishers_path
      else
        # if not save in that case render new
        render 'new'
      end
    end
  end

	def change_theme
	 @publisher = Publisher.new
	 @themes = Theme.all
	end
	def save_theme_for_publisher
	 publisher = Publisher.find(params[:publisher][:id])
	 publisher.theme_name = params[:publisher][:theme_name]
	 publisher.save!
	 redirect_to publishers_path
	end

	def destroy
	  Theme.find_by(id: params[:id]).destroy
	  redirect_to :back
	end

 private 
  def theme_params
    params.require(:theme).permit(:theme_name, :template)
  end
end
