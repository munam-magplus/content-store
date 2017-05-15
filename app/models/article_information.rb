class ArticleInformation < ApplicationRecord
	include Filterable
	belongs_to :article, optional: true
end
