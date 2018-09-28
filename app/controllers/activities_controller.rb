class ActivitiesController < ApplicationController
	before_action :require_login

	def home
		@activities = current_user.activity_feed.order(created_at: :desc).page(params[:page]).per(5)
		@user = User.find_by(id: current_user)
		@lesson = @user.lessons
	end

	def show
		@user = current_user
		@category_id = params[:categories]

		if @category_id.empty?
			@answers = @user.answers.page(params[:page]).per(10)
		else
			@answers = @user.answers.joins(:lesson).where("lessons.category_id": @category_id).page(params[:page]).per(10)
		end

		@category_choices = @user.categories.map{|category| [category.title, category.id]}
	end

	private
		def require_login
      unless current_user
        flash[:notice] = "Please log in."
        redirect_to root_url
      end
    end
end
