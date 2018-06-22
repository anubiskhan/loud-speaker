class PurchaseConfirmationMailer < ApplicationMailer
  def purchase_mailer(user)
    @user = user
    mail(to: @user.email, subject: 'Loud Speaker Purchase Confirmation')
  end
end
