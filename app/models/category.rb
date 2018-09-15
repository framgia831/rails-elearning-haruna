class Category < ApplicationRecord
	has_many :lessons
	has_many :words, dependent: :destroy

	accepts_nested_attributes_for :words
	accepts_nested_attributes_for :lessons

	validates :title, presence: true
	validates :description, presence: true
end
