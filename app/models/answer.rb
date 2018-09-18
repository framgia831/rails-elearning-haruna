class Answer < ApplicationRecord
	belongs_to :word
	belongs_to :choice
	belongs_to :lesson

	def correct_answer
		choices.find_by(correct: true)
	end
end
