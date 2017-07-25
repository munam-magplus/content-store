class BooksPrimaryContentInformation < ApplicationRecord
	include Filterable
	belongs_to :publisher
	has_one :books_contributor
	has_one :books_content_pricing
	has_one :books_content_access_rule
	has_many :subject_group_books
	has_many :subject_groups , through: :subject_group_books
	belongs_to :license, optional: true
	has_one :positive_reviews, -> { where("first_name > 3.0") }, class_name: "Review"

	#used for uploading image
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
    #scope
    scope :book_title, -> (book_title) { where("book_title LIKE ?", "%#{book_title}%") }
end
