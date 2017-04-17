class Journal < ApplicationRecord
	include Filterable # Search Module
	# Validations
	validates_presence_of :journal_code
  	validates_presence_of :publisher
  	validates_presence_of :journal_title
  	validates_presence_of :language
  	validates_presence_of :journal_categories
  	validates_presence_of :journal_description
end