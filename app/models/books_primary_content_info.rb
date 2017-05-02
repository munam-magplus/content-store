class BooksPrimaryContentInfo < ApplicationRecord
	include Filterable
	belongs_to :license, optional: true
end
