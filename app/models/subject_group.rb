class SubjectGroup < ApplicationRecord
	include Filterable # Search Module
	# Validations
  	validates_presence_of :publisher_id, :subject_group_code,
  	:subject_group_name, :language
end
