class LessonsController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@word = @category.words.find_by(category_id: params[:category_id])
	end
end
