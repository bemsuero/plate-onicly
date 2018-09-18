class ApplicationMailer < ActionMailer::Base
  default from: 'plateonicly@gmail.com'
  layout 'mailer'

  def confirmation_email(guest_user)
    @guest_user = guest_user
    mail(to: @guest_user[:email], subject: 'You have succesfully joined a meetup')
  end
end
