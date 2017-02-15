class Country < ApplicationRecord
	self.table_name = "CDP_COUNTRY"
	has_one :countryname, :foreign_key => "CON_COUNTRY_ID"
	belongs_to :pubcountry, :foreign_key => "PUY_COUNTRY_CODE"
end