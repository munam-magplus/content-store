class SubjectGroup < ApplicationRecord
	include Filterable # Search Module
	# Validations
  	validates_presence_of :publisher_id
	validates_presence_of :subject_group_code
  	validates_presence_of :subject_group_name
  	validates_presence_of :language
end
