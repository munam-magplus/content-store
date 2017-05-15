class AdminUser < ApplicationRecord
	include Filterable # search module
	# Validations
	validates_presence_of :publisher_id
	validates_presence_of :email
	validates_presence_of :password
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :country_code
	validates_presence_of :language
end
