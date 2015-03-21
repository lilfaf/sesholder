class UserMailer < ApplicationMailer
  def subscribed(user)
    @user = user
    mail(to: @user.email, subject: t('email_subject'))
  end
end
