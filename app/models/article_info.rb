class ArticleInfo < ApplicationRecord
	include Filterable
	belongs_to :article
end
