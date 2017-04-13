class BookContent < ApplicationRecord
	has_one :books_contributor
	has_one :books_seo_config
	has_one :books_content_pricing
end