class EndUserContactMailer < ApplicationMailer

	def contact_email(publisher,name, email, subject, body)
    @name = name
    @email = email
    @body = body
    @subject = subject

    mail(from: email, subject: subject , to: publisher.contact_email)
  end
end
