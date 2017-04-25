class InstitutionAccount < ApplicationRecord
	include Filterable
	# belongs_to :institution_admin_user_acc
	has_one :institution_acc_billing_address, dependent: :destroy
	accepts_nested_attributes_for :institution_acc_billing_address
end