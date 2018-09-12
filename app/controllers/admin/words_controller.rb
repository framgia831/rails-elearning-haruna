class Admin::WordsController < ApplicationController
	before_action :admin_user
	include UsersHelper

	def index
		@words = Word.all
		@answers = Answer.all
		@category = Category.find(params[:category_id])
	end

	def new
		@category = Category.find(params[:category_id])
		@word = @category.words.build
		@choice = @word.choices.build
	end

	def create
		@category = Category.find(params[:category_id])
		@word = @category.words.build(word_params)
		@choice = @word.choices.build(choice_params)
		if @word.save && @choice.save
			flash[:notice] = "Sucessfully created!"
			redirect_to admin_category_words_path(@category)
		else
			render "new"
		end
	end

	def show
		@word = Word.find(params[:category_id])
		@choices = Choice.find(params[:word_id])
		@category = Category.find(params[:category_id])
	end

	def edit
		@word = Word.find(params[:category_id])
		@choice = Choice.find(params[:word_id])
	end

	def update
		@word = Word.find(params[:category_id])
		@choice = Choice.find(params[:word_id])
		@category = Category.find(params[:category_id])
		if @word.update(word_params) || @choice.upcate(choice_params)
			flash[:notice] = "Sucessfully saved!"
			redirect_to admin_category_word_path(@category)
		else
			render "edit"
		end
	end

	def destroy
		@word = Word.find(params[:category_id])
    @word.destroy

    redirect_to admin_category_words_path(@category)
	end

	private
		def admin_user
			redirect_to root_path unless current_user.admin?
		end

		def word_params
			arams.require(:word).permit(:content)
		end

		def choice_params
			arams.require(:choice).permit(:content)
		end

end
