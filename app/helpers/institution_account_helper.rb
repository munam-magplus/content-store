module InstitutionAccountHelper
	def institution_account(inst_acc_id)
 		@inst_acc_id = inst_acc_id
		@id = InstitutionAccount.where(:id => @inst_acc_id )
	end
end


