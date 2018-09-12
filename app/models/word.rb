class Word < ApplicationRecord
	belongs_to :category
	
	# has_many :answers
	# has_many :choices

	# accepts_nested_attributes_for :choices
	# accepts_nested_attributes_for :answers

	validates :content, presence: true
end
