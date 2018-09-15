class Lesson < ApplicationRecord
	belongs_to :user
	belongs_to :category

	has_many :answers

	accepts_nested_attributes_for :answers
end
