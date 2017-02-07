class Retailer < ApplicationRecord
	self.table_name = "CDP_RETAILER"
	belongs_to :publishers, optional: true
end 