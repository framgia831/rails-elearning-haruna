class RelationshipsController < ApplicationController
	include UsersHelper
	def create
		relationship = Relationship.create(
			follower_id: current_user.id,
			followed_id: params[:followed_id]
			)

		relationship.activity.create(user: current_user)
		redirect_to user_url(params[:followed_id])
	end

	def destroy
		relationship = Relationship.find(params[:id])
		relationship.activity.destroy
		relationship.destroy

		redirect_to user_url(relationship.followed_id)
	end

end
