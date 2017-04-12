class InstitutionAdminUserMailer < ApplicationMailer
	def confirm_mail(inst_admin_user, current_user)
		@current_user = current_user
		@inst_admin_user = inst_admin_user
		mail(from: @current_user.email  , to: @inst_admin_user.email,subject:'confirmation mail')
	end
end

