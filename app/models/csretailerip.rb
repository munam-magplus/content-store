class Csretailerip < ApplicationRecord
	self.table_name = "CDP_RETAILER_IP_DETAILS"
	belongs_to :csretailer, :foreign_key => "RETAILER_ID"
end

