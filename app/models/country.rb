class Country < ApplicationRecord
	validates_uniqueness_of :country_code
end
