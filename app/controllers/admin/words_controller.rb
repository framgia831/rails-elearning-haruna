class Admin::WordsController < ApplicationController
	before_action :admin_user
	include UsersHelper

	def index
		@words = Word.all
		@category = Category.find(params[:category_id])
	end

	def new
		@category = Category.find(params[:category_id])
		@word = @category.words.build
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
	end

	def edit
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
	end

	def update
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])

		if @word.update(word_params)
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
			params.require(:word).permit(:content)
		end

		# def choice_params
		# 	params.require(:choice).permit(:content)
		# end

end
