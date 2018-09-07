class User < ApplicationRecord
	has_secure_password

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true
	validates :email, presence: true,
										format: { with: EMAIL_REGEX },
										uniqueness: true

	

end
