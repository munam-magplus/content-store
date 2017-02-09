class Countryname < ApplicationRecord
	self.table_name = "CDP_COUNTRY_NAME"
	has_many :countries
end