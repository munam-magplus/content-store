class Publisher < ApplicationRecord
	self.table_name = "CDP_PUBLISHER"
	has_one :publisher_contact, :foreign_key => "PUB_PUBLISHER_ID"
<<<<<<< HEAD
	has_many :retailers
	belongs_to :institution, :class_name => "Institution", :foreign_key => "PUB_PUBLISHER_ID"	

	def self.search(code,name)
  	 result = where("pub_code LIKE ? AND pub_name LIKE ?", "%#{code}%", "%#{name}")
	end
=======
  	accepts_nested_attributes_for  :publisher_contact
	has_many :retailers
	def self.search(code,name)
  	 result = where("pub_code LIKE ? AND pub_name LIKE ?", "%#{code}%", "%#{name}")
	end	
>>>>>>> bfe39f7f7e2b392e89c1a004b4fe88fe8363e199
end