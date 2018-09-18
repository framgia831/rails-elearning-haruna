class AnswersController < ApplicationController

	def new
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category
		@word = (@category.words - @lesson.words).first
	end

	def create
		lesson = Lesson.find(params[:lesson_id])
		category = lesson.category
		answer = lesson.answers.build(
																		choice_id: params[:choice_id],
																		word_id: params[:word_id]
																		)
		
		if answer.save
			word = (category.words - lesson.words).first
			if word == nil
				redirect_to lesson_path(lesson)
			else
				redirect_to new_lesson_answer_path(lesson)
			end
		end

	end

end
