class Retailerip < ApplicationRecord
	self.table_name = "CDP_RETAILER_IP_DETAILS"
	belongs_to :retailer
end