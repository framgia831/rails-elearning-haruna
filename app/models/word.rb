class Word < ApplicationRecord
	belongs_to :category
	
	has_many :answers
	has_many :choices, dependent: :delete_all

	accepts_nested_attributes_for :choices
	accepts_nested_attributes_for :answers

	validates :content, presence: true
	validates :correct, acceptance: true

	def correct_answer
		choices.find_by(correct: true)
	end
end
