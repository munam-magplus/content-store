class Institution < ApplicationRecord
	has_many :publishers, :foreign_key => "pub"
	has_one :institution_acc_billing_addresses
	accepts_nested_attributes_for :institution_acc_billing_addresses
end
