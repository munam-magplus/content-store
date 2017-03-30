class PublisherContact < ApplicationRecord
	belongs_to :publisher,:foreign_key => "PUB_PUBLISHER_ID" , :optional => "true"
end