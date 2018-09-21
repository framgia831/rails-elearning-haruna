class Lesson < ApplicationRecord
	belongs_to :user
	belongs_to :category

	has_many :answers
  has_many :words, through: :answers
	has_many :choices, through: :answers
	has_many :activity, as: :action

	# def activity_create
	# 	activity.create(user: current_user)
	# end
end
