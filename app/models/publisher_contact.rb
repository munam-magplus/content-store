class PublisherContact < ApplicationRecord
	self.table_name = "CDP_PUBLISHER_CONTACTS"
	belongs_to :publisher,:foreign_key => "PUB_PUBLISHER_ID" , :optional => "true"
end