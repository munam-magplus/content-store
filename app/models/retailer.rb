class Retailer < ApplicationRecord
	include Filterable #search module
	# validating fields
	validates :retailer_code, presence: true, uniqueness: true
	validates :retailer_name, presence: true
	validates :publisher_id, presence: true
	validates :low_ip, presence: true
	validates :high_ip, presence: true
	validates :ip_list, presence: true
end
 