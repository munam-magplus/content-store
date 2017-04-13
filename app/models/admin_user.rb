class AdminUser < ApplicationRecord
	include Filterable # search module
	# Validations
	validates_presence_of :publisher
  	validates_presence_of :email
  	validates_presence_of :confirm_email
  	validates_presence_of :password
  	validates_presence_of :confirm_password
  	validates_presence_of :first_name
  	validates_presence_of :last_name
  	validates_presence_of :country
  	validates_presence_of :language
  	validates_presence_of :role
  	validates_presence_of :publishers
end
