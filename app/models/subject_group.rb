class SubjectGroup < ApplicationRecord
	self.table_name = "CDP_SUBJECT_GROUP"
	include Filterable

	# def self.search(pub_id,name,code,lang_id)
 #  	 result = where("PUB_PUBLISHER_ID LIKE ? AND SUG_GROUP_NAME LIKE ? AND SUG_GROUP_CODE LIKE ? AND LAN_LANGUAGE_ID LIKE ?", "%#{pub_id}%", "%#{name}%", "%#{code}%", "%#{lang_id}")
	# end
end
