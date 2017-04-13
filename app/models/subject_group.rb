class SubjectGroup < ApplicationRecord
	include Filterable # Search Module
	# Validations
  	validates_presence_of :publisher
	validates_presence_of :subject_group_code
  	validates_presence_of :subject_group_name
  	validates_presence_of :select_language
end
