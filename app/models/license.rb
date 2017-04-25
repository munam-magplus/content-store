class License < ApplicationRecord
	include Filterable
	has_many :books_primary_content_infos, dependent: :destroy
	belongs_to :license_group, optional: true
end 