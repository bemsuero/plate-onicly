class ApplicationMailer < ActionMailer::Base
  default from: 'plateonicly@gmail.com'
  layout 'mailer'

  def confirmation_email(guest_user)
    @guest_user = guest_user
    mail(to: 'akkount35@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
