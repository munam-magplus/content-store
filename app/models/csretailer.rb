class Csretailer < ApplicationRecord
	self.table_name = "CDP_RETAILER"
	belongs_to :publishers, optional: true
	has_one :csretailerip, :foreign_key => "CRI_RETAILER_CODE"
	# accepts_nested_attributes_for :retailerip
end 


