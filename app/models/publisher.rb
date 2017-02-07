class Publisher < ApplicationRecord
	self.table_name = "CDP_PUBLISHER"
	has_many :retailers
end