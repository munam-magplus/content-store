class BooksPrimaryContentInformation < ApplicationRecord
	include Filterable
	belongs_to :publisher
	belongs_to :member_publisher, optional: true
	has_many :books_contributors, dependent: :destroy
	has_one :books_content_pricing
	has_one :books_content_access_rule
	has_many :subject_group_books
	has_many :subject_groups , through: :subject_group_books
	has_many :subscription_books
	has_many :subscriptions, through: :subscription_books
	belongs_to :license, optional: true
	has_one :positive_reviews, -> { where("first_name > 3.0") }, class_name: "Review"

	#used for uploading image
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
    #scope
    default_scope { where("status = 'Active'") }
    scope :book_title, -> (book_title) { where("book_title LIKE ?", "%#{book_title}%") }

  def self.get_books(value)
 		return BooksPrimaryContentInformation.joins(:books_contributors).where('book_title LIKE ? OR isbn LIKE ? OR (first_name = ? AND last_name = ?)',"%#{value}%", "%#{value}%","#{value.split()[0]}","#{value.split()[1]}")
  end
end
