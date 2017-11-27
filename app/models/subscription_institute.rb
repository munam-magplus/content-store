class SubscriptionInstitute < ApplicationRecord
	belongs_to :institution_account
	belongs_to :subscription
end
