class Subject < ApplicationRecord
	include Filterable # Search Module
	belongs_to :publisher
  	has_many :subject_groups
end
