class Relationship < ApplicationRecord
	has_many :activity, as: :action
	belongs_to :followed, class_name: "User"
	belongs_to :follower, class_name: "User"
end