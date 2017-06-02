class Article < ApplicationRecord
	include Filterable # Search Module
  # Associations
	has_one :article_information
	accepts_nested_attributes_for :article_information
	# Validations
	validates_presence_of :publisher, :content_code,:journal_title,
    :article_type, :issue_type,:volume_number,:issue_number,
    :issue_supplement,:issue_number_begin,:issue_number_end,
    :access_level,:article_language,:external_drm,
    :publisher_date   
end
