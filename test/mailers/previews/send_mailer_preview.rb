# Preview all emails at http://localhost:3000/rails/mailers/send_mailer
class SendMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_mailer/send_email
  def send_email
    SendMailer.send_email
  end

end
