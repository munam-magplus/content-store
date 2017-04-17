class Article < ApplicationRecord
	include Filterable # Search Module
  # Associations
	has_one :article_info
	accepts_nested_attributes_for :article_info
	# Validations
	validates_presence_of :publisher
  	validates_presence_of :content_code
  	validates_presence_of :journal_title
  	validates_presence_of :article_type
  	validates_presence_of :issue_type
  	validates_presence_of :volume_number
  	validates_presence_of :issue_number
  	validates_presence_of :issue_supplement
  	validates_presence_of :issue_number_begin
  	validates_presence_of :issue_number_end
  	validates_presence_of :access_level
  	validates_presence_of :article_language
  	validates_presence_of :external_drm
  	validates_presence_of :publisher_date
end
