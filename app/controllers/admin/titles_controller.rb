class Admin::TitlesController < ApplicationController

	def new
		@title = Title.new
	end

	def create
		@title = Title.new
		@title.save
		redirect_to admin_titles_path
	end

	def index

	end



	def show

	end

	def find
	end

	def edit
		@titles = Title.new
		#こうしたい@titles = Title.find(params[:id])
	end

	def destroy

	end
end
