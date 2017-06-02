class EndUser < ApplicationRecord
	include Filterable # Search Module
	# Validations
	validates_presence_of :publisher_id,:email, :password,
		:first_name, :last_name, :country_code
end
