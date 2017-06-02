class InstitutionAdminUserAccount < ApplicationRecord
	include Filterable
	validates_presence_of :institution_name, :password, :user_name, :status 
	# has_many :institution_accounts
end
