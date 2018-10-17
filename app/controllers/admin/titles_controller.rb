class Admin::TitlesController < ApplicationController

	def new
		@title = Title.new
	end

	def create
		@title = Title.new(title_params)
		@title.save
		redirect_to admin_titles_path
	end

	def index
		@titles = Title.all
	end

	def show

	end

	def update
		@title = Title.find(prams[:id])
		@title.update(title_params)
		redirect_to admin_titles_path
	end

	def find

	end

	def edit
		@title = Title.find(params[:id])
	end

	def destroy
		@title = Title.find(params[:id])
		@title.destroy
		redirect_to admin_titles_path
	end

	private
   	def title_params
 	  	params.require(:title).permit(:title, :price, :stock)
    end
end
