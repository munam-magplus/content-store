class Publisher < ApplicationRecord
	self.table_name = "CDP_PUBLISHER"
	
	has_many :csretailers
	belongs_to :institution, :foreign_key => "PUB_PUBLISHER_ID", optional: true
	has_one :publisher_contact, :foreign_key => "PUB_PUBLISHER_ID"
	accepts_nested_attributes_for  :publisher_contact

	has_one :pubcountry, :foreign_key => "PUB_PUBLISHER_ID"

	def self.search(code,name)
  	 result = where("pub_code LIKE ? AND pub_name LIKE ?", "%#{code}%", "%#{name}")
	end

end