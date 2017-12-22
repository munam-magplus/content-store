class MemberPublisher < ApplicationRecord
	belongs_to :publisher
	has_many :books_primary_content_informations

	#used for uploading image
	has_attached_file :member_publisher_logo, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :member_publisher_logo, content_type: /\Aimage\/.*\z/
	
	def self.get_member_publishers(publisher_id)
		return MemberPublisher.where('publisher_id = ?',publisher_id)
  end
end