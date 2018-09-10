class User < ApplicationRecord
	mount_uploader :image_name, ImageNameUploader

	has_many :lessons

	has_secure_password

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true
	validates :email, presence: true,
										format: { with: EMAIL_REGEX },
										uniqueness: true

	def followers
		Relationship.where(followed_id: id)
	end

	def following
		Relationship.where(follower_id: id)
	end

	def relationship(other_user)
		Relationship.find_by(
			follower_id: id,
			followed_id: other_user.id
		)
	end

end
