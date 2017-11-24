class InstitutionAccount < ApplicationRecord
	include Filterable
	has_many :library_users
	has_many :ip_addresses, dependent: :destroy
	has_many :users
	has_one :institution_account_billing_address, dependent: :destroy
	accepts_nested_attributes_for :institution_account_billing_address
	accepts_nested_attributes_for :ip_addresses,  reject_if:lambda { |attrs|
                                attrs.all? { |key, value| value.blank? }
                                },
                                allow_destroy:true
	
	#used for uploading image
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end

