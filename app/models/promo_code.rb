class PromoCode < ApplicationRecord
	include Filterable #search module
	# Validations
  #-----------------------------------------------------------------------------
	validates_presence_of :publisher_id
	validates_presence_of :campaign_id
	validates_presence_of :number_of_promo_code
	validates_presence_of :applicable_discount
	validates_presence_of :valid_from
	validates_presence_of :valid_to
  	validates_numericality_of :applicable_discount, on: :create
  	#-----------------------------------------------------------------------------
end
