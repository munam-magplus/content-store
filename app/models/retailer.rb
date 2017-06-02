class Retailer < ApplicationRecord
	include Filterable #search module
	# validating fields
	validates_presence_of :retailer_code, uniqueness: true
	validates_presence_of :retailer_name, :publisher_id, :low_ip,
	:high_ip, :ip_list
end
 