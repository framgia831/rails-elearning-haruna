class Admin::WordsController < ApplicationController
	before_action :admin_user
	include UsersHelper

	def index
		@category = Category.find(params[:category_id])
		@words = @category.words.all
	end

	def new
		@category = Category.find(params[:category_id])
		@word = @category.words.build
		3.times { @word.choices.build }
	end

	def create
		@category = Category.find(params[:category_id])
		@word = @category.words.build(word_params)

		if @word.save
			flash[:notice] = "Sucessfully created!"
			redirect_to admin_category_words_path(@category)
		else
			render "new"
		end
	end

	def show
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
		@choices = @word.choices
	end

	def edit
		@category = Category.find(params[:category_id])
		@word = @category.words.find(params[:id])
	end

	def update
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
		@word.assign_attributes(word_params)
		if @word.save
			flash[:notice] = "Sucessfully saved!"
			redirect_to admin_category_words_path(@category)
		else
			render "edit"
		end
	end

	def destroy
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
    @word.destroy

    redirect_to admin_category_words_path
	end

	private
		def admin_user
			redirect_to root_path unless current_user.admin?
		end

		def word_params
			params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct])
		end

end
