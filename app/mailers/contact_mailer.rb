class ContactMailer < ApplicationMailer
	def contact_details(contact)
		@contact = contact
		mail(from: @contact.email  , to: "test@gmail.com",subject:'confirmation mail')
	end
end
