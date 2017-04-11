class Article < ApplicationRecord
	include Filterable
	has_many :article_infos
	accepts_nested_attributes_for :article_infos
end
