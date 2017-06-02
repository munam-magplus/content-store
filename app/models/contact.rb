class Contact < ApplicationRecord
	validates_presence_of :subject, :topic, :phone_number, 
		:fax_number, :comments
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { with:  VALID_EMAIL_REGEX}, presence: true
end
