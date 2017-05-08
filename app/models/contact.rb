class Contact < ApplicationRecord
	validates :subject, presence: true
	validates :topic, presence: true
	validates :phone_number, presence: true
	validates :fax_number, presence: true
	validates :comments, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { with:  VALID_EMAIL_REGEX}, presence: true
end
