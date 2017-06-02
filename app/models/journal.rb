class Journal < ApplicationRecord
	include Filterable # Search Module
	# Validations
	validates_presence_of :journal_code, :publisher, :journal_title,
		:language, :journal_categories, :journal_description
end