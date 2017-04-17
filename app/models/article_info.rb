class ArticleInfo < ApplicationRecord
	include Filterable
	belongs_to :article, optional: true
end
