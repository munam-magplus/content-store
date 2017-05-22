class Publisher < ApplicationRecord
	include Filterable #search module
	# Validations
  	#-----------------------------------------------------------------------------
	validates_presence_of :publisher_name
  	validates_presence_of :publisher_code
  	validates_presence_of :publisher_type
  	validates_presence_of :contact_first_name
  	validates_presence_of :contact_last_name
  	validates_presence_of :contact_email
  	#-----------------------------------------------------------------------------
end
