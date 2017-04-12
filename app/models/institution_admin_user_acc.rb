class InstitutionAdminUserAcc < ApplicationRecord
	include Filterable
	validates :institution_name, :presence => true 
	validates :password, :presence => true 
	validates :confirm_password, :presence => true 
	validates :user_name, :presence => true 
	validates :status, :presence => true 
end
