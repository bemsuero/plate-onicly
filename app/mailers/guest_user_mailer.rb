class GuestUserMailer < ApplicationMailer
  def confirmation_email(guest_user)
    @guest_user = guest_user
    mail(to: @guest_user[:email], subject: 'You have succesfully created a meetup')
  end
  def join_email(email_info)
    @email_info = email_info
    mail(to: @email_info[:email], subject: "You have a succesful meetup")
  end
end
