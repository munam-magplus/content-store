class AdminUserMailer < ApplicationMailer
	def confirm_mail(admin_user, current_user)
		@current_user = current_user
		@admin_user = admin_user
		mail(from: @current_user.email  , to: @admin_user.email,subject:'confirmation mail')
	end
end

