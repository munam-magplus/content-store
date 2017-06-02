class AdminUser < ApplicationRecord
	include Filterable # search module
	# Validations
	validates_presence_of :publisher_id, :email,:password, :first_name,
						  :last_name, :country_code, :language
end
