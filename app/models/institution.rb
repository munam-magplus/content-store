class Institution < ApplicationRecord
	self.table_name = "CDP_INSTITUTION_DETAILS"
	has_many :publishers, :class_name => "Publisher", :foreign_key => "PUB_PUBLISHER_ID"
end