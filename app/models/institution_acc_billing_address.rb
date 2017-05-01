class InstitutionAccBillingAddress < ApplicationRecord
		include Filterable
	belongs_to :institution_account, optional: true
end