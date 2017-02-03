class Retailer < ApplicationRecord
	self.table_name = "CDP_RETAILER"

	
	def self.get_retailer_names
		retailers = Retailer.pluck(:REATILER_NAME)
	end

end