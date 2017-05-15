class InstitutionAdminUserAccount < ApplicationRecord
	include Filterable
	validates :institution_name, :presence => true 
	validates :password, :presence => true 
 	validates :user_name, :presence => true 
	validates :status, :presence => true 

	# has_many :institution_accounts

end
