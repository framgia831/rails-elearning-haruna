class ActivitiesController < ApplicationController
	def home
		@user = current_user
		@activities = @user.activity_feed.order(created_at: :desc)
		@activity = @user.activities.where(action_type: "Lesson")
	end

	def show
		@user = current_user
		@answer = @user.answers
	end
end
