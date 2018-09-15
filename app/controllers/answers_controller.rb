class AnswersController < ApplicationController
	def show
		@category = Category.find(params[:id])
		@words = @category.words

		@word = Word.find(params[:id])
		@choices = @word.choices
	end
end
