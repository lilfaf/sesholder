class UserMailerPreview < ActionMailer::Preview
  def subscribed
    user = User.create(email: 'test@email.com')
    UserMailer.subscribed(user)
  end
end
