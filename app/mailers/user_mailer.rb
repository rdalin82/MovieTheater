class UserMailer < ApplicationMailer
  def purchase_email(user)
    @user = user
    mail(to: user.email, subject: "Ticket Purchase")
  end
end
