class User < ApplicationRecord
	mount_uploader :image_name, ImageNameUploader

	has_many :lessons
	has_many :words, through: :lessons
	has_many :answers, through: :lessons
	has_many :activities
	has_many :categories, through: :lessons
	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name: "Relationship",
																	foreign_key: "followed_id",
																	dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
	
	has_secure_password

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true
	validates :email, presence: true,
										format: { with: EMAIL_REGEX },
										uniqueness: true

	def relationship(other_user)
		Relationship.find_by(
			follower_id: id,
			followed_id: other_user.id
		)
	end

	def activity_feed
		ids = following.pluck(:followed_id)
		ids << id

		Activity.where(user_id: ids)
	end

end
