class LessonsController < ApplicationController
	before_action :require_login

	def index
		@categories = Category.page(params[:page]).per(6)
	end

	def create
		@category = Category.find(params[:category_id])
		@lesson = @category.lessons.build(user: current_user)

		if @lesson.save
			redirect_to new_lesson_answer_path(@lesson)
		else
			flash[:notice] = "You have to sign up or log in."
			render root_path
		end
	end

	def show
		@lesson = Lesson.find(params[:id])
		@category = @lesson.category
		@answer = @lesson.answers
	end

end
