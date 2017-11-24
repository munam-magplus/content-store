# Preview all emails at http://localhost:3000/rails/mailers/end_user_mailer
class EndUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/end_user_mailer/password_reset
  def password_reset
    EndUserMailer.password_reset
  end

end
