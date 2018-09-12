class Category < ApplicationRecord
	has_many :lessons
	has_many :words

	accepts_nested_attributes_for :words

	validates :title, presence: true
	validates :description, presence: true
end
