class Publisher < ApplicationRecord
	include Filterable #search module
	has_many :csretailers
	belongs_to :institution, :foreign_key => "PUB_PUBLISHER_ID", optional: true
	has_one :publisher_contact, :foreign_key => "PUB_PUBLISHER_ID"
	has_one :pubcountry, :foreign_key => "PUB_PUBLISHER_ID"
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
