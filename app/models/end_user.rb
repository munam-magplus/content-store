class EndUser < ApplicationRecord
	include Filterable # Search Module
	# Validations
	validates_presence_of :publisher
  	validates_presence_of :email
  	validates_presence_of :confirm_email
  	validates_presence_of :password
  	validates_presence_of :confirm_password
  	validates_presence_of :first_name
  	validates_presence_of :last_name
  	validates_presence_of :country
end
