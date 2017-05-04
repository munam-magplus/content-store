module InstitutionAccountHelper
	def institution_account(inst_acc_id)
		byebug
 		@inst_acc_id = inst_acc_id
		@id = InstitutionAccount.find_by_id(@inst_acc_id )
	end
end


