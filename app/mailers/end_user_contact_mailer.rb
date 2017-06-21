class EndUserContactMailer < ApplicationMailer
	default to: "iamaiyaz@hotmail.com"

	def contact_email(publisher,name, email, subject, body)
    @name = name
    @email = email
    @body = body
    @subject = subject

    mail(from: email, subject: subject)
  end
end
