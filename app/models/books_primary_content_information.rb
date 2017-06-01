class BooksPrimaryContentInformation < ApplicationRecord
	include Filterable
	belongs_to :publisher
	has_one :books_contributor
	has_one :books_content_pricing
	has_one :books_content_access_rule
	has_many :subject_groups , through: :subject_group_books
	belongs_to :license, optional: true
	#used for uploading image
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
