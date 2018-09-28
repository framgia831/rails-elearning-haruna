class LessonsController < ApplicationController

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
	end

end
