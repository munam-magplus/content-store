class InstitutionAdminUserMailer < ApplicationMailer
	def confirm_mail(institution_admin_user, current_user)
		@current_user = current_user
		@institution_admin_user = institution_admin_user
		mail(from: @current_user.email  , to: @institution_admin_user.email,subject:'confirmation mail')
	end
end

