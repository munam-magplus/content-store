class Countryname < ApplicationRecord
	self.table_name = "CDP_COUNTRY_NAME"
	belongs_to :country, :foreign_key => "COI_COUNTRY_ID"
end