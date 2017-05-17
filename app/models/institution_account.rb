class InstitutionAccount < ApplicationRecord
	include Filterable
	has_many :library_users
	has_one :institution_account_billing_address, dependent: :destroy
	accepts_nested_attributes_for :institution_account_billing_address
	
	#used for uploading image
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end