class License < ApplicationRecord
	self.table_name = "CDP_LICENSE"
	include Filterable
end 