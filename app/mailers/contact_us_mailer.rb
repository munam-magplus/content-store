class ContactUsMailer < ApplicationMailer
	def contact_details(contact_us , current_user)
		@current_user = current_user
		@contact_us = contact_us
		mail(from: @current_user.email  , to: "test@gmail.com",subject:'confirmation mail')
	end
end
