class SubjectGroup < ApplicationRecord
	include Filterable # Search Module
	belongs_to :publisher
	has_many :subject_group_books
  	has_many :books_primary_content_informations, through: :subject_group_books 
	# Validations
  	validates_presence_of :publisher_id, :subject_group_code,
  	:subject_group_name, :language
end
