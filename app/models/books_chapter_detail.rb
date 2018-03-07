class BooksChapterDetail < ApplicationRecord
	belongs_to :books_primary_content_information, optional: true
end
