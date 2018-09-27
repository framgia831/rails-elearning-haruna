class CategoriesController < ApplicationController
		before_action :require_login

	def index
		if params[:lesson] == "1"
			@categories = current_user.categories.page(params[:page]).per(6)
		elsif params[:lesson] == "0"
			@categories = Category.where.not(id: current_user.category_ids).page(params[:page]).per(6)
		else
			@categories = Category.page(params[:page]).per(6)
		end
	end

end
