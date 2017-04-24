class LicenseGroup < ApplicationRecord
	include Filterable
	has_many :licenses, dependent: :destroy
end 