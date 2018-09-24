class Admin::CategoriesController < ApplicationController
	before_action :admin_user
	include UsersHelper

	def index
		@categories = Category.page(params[:page]).per(8)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "Sucessfully created!"
			redirect_to admin_categories_path
		else
			render "new"
		end
	end

	def edit
		@category = Category.find_by(id: params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)

		redirect_to admin_categories_path
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		redirect_to admin_categories_path
	end

	private
		def admin_user
			redirect_to root_path unless current_user.admin?
		end

		def category_params
			params.require(:category).permit(:title, :description)
		end

end
