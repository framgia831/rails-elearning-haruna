class ActivitiesController < ApplicationController
	before_action :require_login

	def home
		@activities = current_user.activity_feed.order(created_at: :desc)
	end

	def show
		@user = current_user
		@answer = @user.answers
	end

	private
		def require_login
      unless current_user
        flash[:notice] = "Please log in."
        redirect_to root_url
      end
    end
end
