class InstitutionAccBillingAddress < ApplicationRecord
	belongs_to :institution_account, optional: true
end
