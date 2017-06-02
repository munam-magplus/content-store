class PromoCode < ApplicationRecord
	include Filterable #search module
	# Validations
  #-----------------------------------------------------------------------------
	validates_presence_of :publisher_id, :campaign_id, :number_of_promo_code,
						:applicable_discount, :valid_from, :valid_to
  	validates_numericality_of :applicable_discount, on: :create
  	#-----------------------------------------------------------------------------
end
