class SubscriptionForBook < ApplicationRecord
	belongs_to :subject_group
	belongs_to :books_primary_content_information
end
