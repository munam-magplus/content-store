class SubscriptionBook < ApplicationRecord
	belongs_to :subscription
	belongs_to :books_primary_content_information, optional: true
	belongs_to :subject_group, optional: true
end
