class MemberPublisher < ApplicationRecord
	belongs_to :publisher
	def self.get_member_publishers(publisher_id)
		return MemberPublisher.where('publisher_id = ?',publisher_id)
  end
end
