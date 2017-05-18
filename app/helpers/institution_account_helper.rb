module InstitutionAccountHelper
	def institution_account(institution_account_id)
  		@institution_account_id = institution_account_id
		@id = InstitutionAccount.find_by_id(@institution_account_id )
	end
end


