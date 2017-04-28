class ContactUsMailer < ApplicationMailer
	def contact_details(contact_us)
		@contact_us = contact_us
		mail(from: @contact_us.email  , to: "test@gmail.com",subject:'confirmation mail')
	end
end
