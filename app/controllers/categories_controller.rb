class CategoriesController < ApplicationController
		before_action :require_login

	def index
		if params[:lesson] == "1"
			@categories = current_user.categories
		elsif params[:lesson] == "0"
			@categories = Category.where.not(id: current_user.category_ids)
		else
			@categories = Category.all
		end

		@categories = @categories.joins(:words).group(:id).order(created_at: :desc).page(params[:page]).per(6)
	end

end
