class ThemesController < ApplicationController
	def index
	end
	def new
	 @theme = Theme.new
	end
	def create
	 @theme = Theme.create!(theme_params)
     flash[:success] = "Theme Uploaded Successfully!"
     # redirect_to new path after create
     redirect_to new_theme_path
	end

	def change_theme
	 @theme = Theme.new
	end
	def get_theme
	 @themes = Theme.all
	end

 private 
  def theme_params
    params.require(:theme).permit(:theme_name, :template)
  end
end
