class Publisher < ApplicationRecord

	include Filterable
	# has_many :csretailers
	# belongs_to :institution, :foreign_key => "PUB_PUBLISHER_ID", optional: true
	# has_one :publisher_contact, :foreign_key => "PUB_PUBLISHER_ID"
	# has_one :pubcountry, :foreign_key => "PUB_PUBLISHER_ID"
	# accepts_nested_attributes_for  :publisher_contact

end
