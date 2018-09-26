class Lesson < ApplicationRecord
	belongs_to :user
	belongs_to :category

	has_many :answers
  has_many :words, through: :answers
	has_many :choices, through: :answers
	has_many :activity, as: :action

	def correct_answers
		choices.where(correct: true)
	end
end
