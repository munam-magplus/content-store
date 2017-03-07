class User < ApplicationRecord
	validates :email, presence: true
	validates :encrypted_password, presence: true
end