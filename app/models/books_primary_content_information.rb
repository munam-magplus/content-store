class BooksPrimaryContentInformation < ApplicationRecord
	include Filterable
	belongs_to :publisher
	has_one :books_contributor
	has_one :books_content_pricing
	has_one :books_content_access_rule
	has_many :subject_group_books
	has_many :subject_groups , through: :subject_group_books
	belongs_to :license, optional: true
	#used for uploading image
	has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  
  def self.get_books_by_advance_search
    BooksPrimaryContentInformation.includes([:subject_groups,:books_content_pricing]).where(:book_title => "agriculture")
  end

  def self.find_by_first_letter(letter)
  	#BooksPrimaryContentInformation.includes(:books_contributor).where("books_contributor.first_name= ?", 'test').order('first_name ASC')
    return BooksPrimaryContentInformation.includes(:books_contributor).where('books_contributor.first_name LIKE ?', "%#{letter}%").order('first_name ASC')
	end
end
