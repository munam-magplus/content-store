class LicenseGroup < ApplicationRecord
	include Filterable
	has_many :licenses, dependent: :destroy
	# Validations
  	#-----------------------------------------------------------------------------
	validates_presence_of :license_group_name
  	#-----------------------------------------------------------------------------
end 