class SendMailer < ApplicationMailer
 default from: "cosmejapantpt@gmail.com"

  def send_email(account, username, session_cart)
    @account = account
    @username = username
    @session_cart  = session_cart
    mail(to: @account, subject: 'CosmeJapan')
  end

  def user_email(account)
  	@acc = account
  	mail(to: @acc.email, subject: 'Register CosmeJapan')
  end

end
