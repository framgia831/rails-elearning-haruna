class Word < ApplicationRecord
	belongs_to :category
	
	has_many :answers
	has_many :choices, dependent: :delete_all

	accepts_nested_attributes_for :choices

	validates :content, presence: true
	validate :one_correct

	def one_correct
		unless choices.map { |c| c.correct }.count(true) == 1
			errors.add(:choices, "should have one correct answer")
		end
	end

	def correct_answer
		choices.find_by(correct: true)
	end
end