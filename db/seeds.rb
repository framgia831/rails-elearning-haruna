# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Haruna",
						email: "starrysky0977@yahoo.co.jp",
						password: "gomachan",
						password_confirmation: "gomachan",
						admin: true)

30.times do |n|
	title = Faker::Lovecraft.tome
	description = Faker::Lovecraft.sentence
	category = Category.create!(
															title: title,
															description: description
															)

	5.times do
		word = category.words.build(content: Faker::Lovecraft.deity)
	
			3.times do
				word.choices.build(content: Faker::Lovecraft.word)
			end

		random = rand(0..2)
		word.choices[random].correct = true
		p word
		word.save
	end
end