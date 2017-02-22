class Pubcountry < ApplicationRecord
	self.table_name = "CDP_PUBLISHER_COUNTRY"
	belongs_to :publisher, :foreign_key => "PUB_PUBLISHER_ID"
	has_one :country, :foreign_key => "COUNTRY_CODE"
end