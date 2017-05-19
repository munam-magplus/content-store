module InstitutionAccountHelper
	def institution_account(institution_account_id)
  		@institution_account_id = institution_account_id
		@institution = InstitutionAccount.where(id: @institution_account_id )
	end
end


