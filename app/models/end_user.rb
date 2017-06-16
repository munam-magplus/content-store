class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	include Filterable # Search Module
	# Validations
	validates_presence_of :publisher_id,:email, :password,
		:first_name, :last_name, :country_code
	# validation for mail
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	# Associations
	belongs_to :publisher
end
