class LicenseGroup < ApplicationRecord
	self.table_name = "CDP_LICENSE_GROUP"
	include Filterable
end 